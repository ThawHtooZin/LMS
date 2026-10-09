const log = document.getElementById("log");
const form = document.getElementById("composer");
const input = document.getElementById("message");
const chatList = document.getElementById("chat-list");
const welcome = "I can open Purchase, Payable, Stock, General Ledger, Packing Material Warehouse, Gate Pass, and Profit and Loss. Ask for one and I will put the full table here. Excel and PDF use that same table.";
let currentChat = 0;

async function history(path, method) {
  const response = await fetch("history.php?path=" + encodeURIComponent(path), {
    method: method || "GET",
    headers: { "Content-Type": "application/json" },
  });
  const data = await response.json().catch(() => ({}));
  if (!response.ok) {
    throw new Error(data.error || "Could not load chats.");
  }
  return data;
}

function addText(role, text) {
  const node = document.createElement("div");
  node.className = "bubble " + role;
  node.textContent = String(text || "").replace(/\*\*/g, "");
  log.appendChild(node);
  log.scrollTop = log.scrollHeight;
  return node;
}

function formatCell(value) {
  if (typeof value === "number") {
    return value.toLocaleString(undefined, { maximumFractionDigits: 3 });
  }
  return value ?? "";
}

function displayValue(column, value) {
  if (value == null || value === "") return "";
  if (/^\d{4}-\d{2}-\d{2}/.test(String(value))) {
    const [year, month, day] = String(value).slice(0, 10).split("-");
    return day + "-" + month + "-" + year;
  }
  if (typeof value === "number") return formatCell(value);
  return value;
}

function isSumColumn(key, rows) {
  const money = ["amount", "viss", "kg", "pcs", "opening", "add_amt", "paid_amt", "quantity", "mc", "hhk_mc", "gfc_mc", "total_mc", "in_qty", "out_qty"];
  if (key === "balance" && rows.some((row) => Object.prototype.hasOwnProperty.call(row, "in_qty"))) return false;
  if (key === "balance" && rows.some((row) => Object.prototype.hasOwnProperty.call(row, "account_code"))) return false;
  return money.includes(key) || key === "balance";
}

function fillTable(host, columns, rows, withIndex) {
  const grid = document.createElement("table");
  grid.className = "grid";
  const head = document.createElement("tr");
  if (withIndex) {
    const no = document.createElement("th");
    no.textContent = "No";
    head.appendChild(no);
  }
  const numeric = {};
  columns.forEach((column) => {
    numeric[column.key] = rows.length > 0 && rows.every((row) => row[column.key] == null || row[column.key] === "" || typeof row[column.key] === "number");
    const cell = document.createElement("th");
    cell.textContent = column.label;
    if (numeric[column.key]) cell.className = "num";
    head.appendChild(cell);
  });
  const thead = document.createElement("thead");
  thead.appendChild(head);
  grid.appendChild(thead);
  const body = document.createElement("tbody");
  rows.forEach((row, index) => {
    const line = document.createElement("tr");
    if (withIndex) {
      const no = document.createElement("td");
      no.textContent = index + 1;
      line.appendChild(no);
    }
    columns.forEach((column) => {
      const cell = document.createElement("td");
      if (numeric[column.key]) cell.className = "num";
      cell.textContent = displayValue(column, row[column.key]);
      line.appendChild(cell);
    });
    body.appendChild(line);
  });
  grid.appendChild(body);
  const totals = columns.filter((column) => isSumColumn(column.key, rows) && numeric[column.key]);
  if (totals.length && rows.length) {
    const foot = document.createElement("tr");
    if (withIndex) {
      const label = document.createElement("td");
      label.textContent = "Total";
      foot.appendChild(label);
    }
    let labeled = !withIndex;
    columns.forEach((column) => {
      const cell = document.createElement("td");
      if (totals.some((item) => item.key === column.key)) {
        const sum = rows.reduce((total, row) => total + (Number(row[column.key]) || 0), 0);
        cell.textContent = formatCell(sum);
        cell.className = "num";
      } else if (!labeled) {
        cell.textContent = "Total";
        labeled = true;
      }
      foot.appendChild(cell);
    });
    const tfoot = document.createElement("tfoot");
    tfoot.appendChild(foot);
    grid.appendChild(tfoot);
  }
  host.appendChild(grid);
}

function addTable(table) {
  const columns = table.columns || [];
  const rows = table.rows || [];
  const card = document.createElement("section");
  card.className = "report";
  const filters = table.filters && Object.keys(table.filters).length
    ? "Filters: " + Object.entries(table.filters).map(([key, value]) => key + " = " + value).join(", ")
    : "No filters. Every row is in this table.";
  card.innerHTML = `
    <div class="report-top">
      <div>
        <h2></h2>
        <p></p>
      </div>
      <div class="actions">
        <button type="button" class="excel">Excel</button>
        <button type="button" class="pdf">PDF</button>
      </div>
    </div>
    <div class="table-wrap"></div>`;
  card.querySelector("h2").textContent = table.title || "Report";
  card.querySelector("p").textContent = "All " + (table.row_count ?? rows.length) + " rows. " + filters;
  const wrap = card.querySelector(".table-wrap");
  const groupKey = rows.length && rows.every((row) => row.supplier_type || row.section) ? (rows[0].supplier_type ? "supplier_type" : "section") : "";
  if (!groupKey) {
    fillTable(wrap, columns, rows, true);
  } else {
    const visible = columns.filter((column) => column.key !== groupKey);
    const names = [];
    rows.forEach((row) => {
      const name = row[groupKey] || "Other";
      if (!names.includes(name)) names.push(name);
    });
    names.forEach((name) => {
      const label = document.createElement("h3");
      label.className = "section-label";
      label.textContent = name;
      wrap.appendChild(label);
      fillTable(wrap, visible, rows.filter((row) => (row[groupKey] || "Other") === name), true);
    });
  }
  card.querySelector(".excel").addEventListener("click", () => download(table.id, "xlsx"));
  card.querySelector(".pdf").addEventListener("click", () => download(table.id, "pdf"));
  log.appendChild(card);
  log.scrollTop = card.offsetTop - 12;
}

async function download(tableId, format) {
  const response = await fetch("export.php", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ table_id: tableId, format, chat_id: currentChat }),
  });
  if (!response.ok) {
    const data = await response.json().catch(() => ({}));
    addText("error", data.error || "Download failed.");
    return;
  }
  const blob = await response.blob();
  const link = document.createElement("a");
  link.href = URL.createObjectURL(blob);
  link.download = format === "pdf" ? "report.pdf" : "report.xlsx";
  link.click();
  URL.revokeObjectURL(link.href);
}

const limitsNode = document.getElementById("limits");

function showLimits(limits) {
  if (!limits) return;
  const limit = Number(limits.limit_tokens);
  const remaining = Number(limits.remaining_tokens);
  const usedCall = Number(limits.total_tokens);
  const parts = [limits.model || "model"];
  if (limit && remaining >= 0) {
    parts.push(remaining.toLocaleString() + " / " + limit.toLocaleString() + " tokens left");
  }
  if (limits.reset_tokens) parts.push("resets in " + limits.reset_tokens);
  if (usedCall) parts.push("this call " + usedCall.toLocaleString());
  limitsNode.textContent = parts.join(" · ");
}

function renderChatList(chats) {
  chatList.innerHTML = "";
  (chats || []).forEach((chat) => {
    const button = document.createElement("button");
    button.type = "button";
    button.className = "chat-item" + (Number(chat.number) === Number(currentChat) ? " active" : "");
    const title = document.createElement("span");
    title.textContent = chat.title || "New chat";
    const when = document.createElement("small");
    when.textContent = "chat" + chat.number + ".txt" + (chat.updated ? " · " + chat.updated : "");
    button.appendChild(title);
    button.appendChild(when);
    button.addEventListener("click", () => openChat(chat.number));
    chatList.appendChild(button);
  });
}

async function refreshList() {
  const data = await history("/chats");
  renderChatList(data.chats || []);
  return data.chats || [];
}

function paintTurns(turns) {
  log.innerHTML = "";
  if (!turns || !turns.length) {
    addText("assistant", welcome);
    return;
  }
  turns.forEach((turn) => {
    if (turn.role === "user") {
      addText("user", turn.text);
      return;
    }
    (turn.tables || []).forEach(addTable);
    addText("assistant", turn.text || "Done.");
  });
  log.scrollTop = log.scrollHeight;
}

async function openChat(number) {
  const record = await history("/chats/" + number);
  currentChat = record.number;
  paintTurns(record.turns || []);
  await refreshList();
}

document.getElementById("new-chat").addEventListener("click", async () => {
  const button = document.getElementById("new-chat");
  button.disabled = true;
  try {
    const created = await history("/chats", "POST");
    await openChat(created.number);
    input.focus();
  } catch (error) {
    addText("error", error.message || "Could not start a new chat.");
  } finally {
    button.disabled = false;
  }
});

form.addEventListener("submit", async (event) => {
  event.preventDefault();
  const message = input.value.trim();
  if (!message) return;
  input.value = "";
  addText("user", message);
  const button = form.querySelector("button");
  button.disabled = true;
  try {
    if (!currentChat) {
      const created = await history("/chats", "POST");
      currentChat = created.number;
    }
    const response = await fetch("chat.php", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ message, chat_id: currentChat }),
    });
    const data = await response.json();
    if (data.chat_id) currentChat = data.chat_id;
    showLimits(data.limits);
    if (!response.ok) {
      addText("error", data.error || "The agent could not answer.");
      await refreshList();
      return;
    }
    (data.tables || []).forEach(addTable);
    addText("assistant", data.reply || "Done.");
    await refreshList();
  } catch (error) {
    addText("error", error.message || "The agent could not be reached.");
  } finally {
    button.disabled = false;
    input.focus();
  }
});

refreshList()
  .then((chats) => {
    if (chats.length) return openChat(chats[0].number);
    paintTurns([]);
  })
  .catch((error) => addText("error", error.message || "Could not load saved chats."));
