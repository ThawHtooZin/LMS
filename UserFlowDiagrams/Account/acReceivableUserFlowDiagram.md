# A/C Receivable — User Flow

This diagram documents how staff review customer balances and record customer receipts.

## 1. Review receivable balances

```mermaid
flowchart TD
    A[Approve invoice in Account → Sales] --> B[Debit Accounts Receivable control account 600 for invoice total]
    A --> C[Credit each selected Revenue Account for its line amount]
    B --> D[Approved invoice becomes an open customer balance]
    C --> D
    E[Open Account → A/C Receivable] --> F[Load sales totals grouped by customer]
    D --> E
    F --> G[Exclude Voided sales; include all other sales statuses]
    G --> H[Calculate Total Billed, Total Paid, and Balance Owed per customer]
    H --> I[Show customers with Total Billed greater than zero]
    I --> J[Order by Balance Owed descending, then customer name]
    J --> K[Review the customer balance table and grand totals]
    K --> L{Need invoice and receipt details?}
    L -->|No| M[Finish]
    L -->|Yes| N[Select Detail for a customer]
    N --> O[Open that customer's Receivable Detail]
```

## 2. Review invoices and payment history

```mermaid
flowchart TD
    A[Open customer Detail] --> B{Customer ID provided?}
    B -->|No| C[Return to A/C Receivable overview]
    B -->|Yes| D[Load customer name]
    D --> E[Load Awaiting Payment and Paid invoices]
    E --> F[Order invoices by date, then invoice ID]
    F --> G[Show date, invoice number, amount, paid amount, balance, and status]
    G --> H{Paid amount is greater than zero?}
    H -->|Yes| I[Select paid amount to expand Payment History]
    H -->|No| J[No history expansion]
    I --> K[Review payment date, deposit account, reference, check number, description, and amount]
    G --> L{Any outstanding balance?}
    L -->|No| M[Receive Payment button is hidden]
    L -->|Yes| N[Select Receive Payment]
    N --> O[Open payment modal]
```

## 3. Receive and allocate a customer payment

```mermaid
flowchart TD
    A[Open Receive Payment modal] --> B[Enter payment date; defaults to today]
    B --> C[Select a deposit account from Asset accounts]
    C --> D[Enter required payment reference]
    D --> E{Selected account is registered as a bank?}
    E -->|Yes| F[Optional Check Number field appears]
    E -->|No| G[Check Number field is hidden and cleared]
    F --> H[Optionally enter description or notes]
    G --> H
    H --> I[Enter required amount; browser shows outstanding balance as maximum]
    I --> J[Submit Receive Payment]
    J --> K[Server loads this customer's Awaiting Payment invoices oldest first]
    K --> L{Open invoices exist and amount is positive?}
    L -->|No| M[Show payment error]
    L -->|Yes| N[Allocate payment oldest invoice first]
    N --> O[Update each invoice paid amount and status]
    O --> P[Save a payment-history row for each allocation]
    P --> Q[Commit transaction and show success]
    Q --> R[Display detail page again]
```

## Rules and details

- The overview groups sales by customer and shows **Total Billed**, **Total Paid**, **Balance Owed**, and a **Detail** action. It also displays grand totals at the bottom.
- Voided, Draft, and Awaiting Approval sales are excluded from the overview calculation. The overview only displays customers whose calculated Total Billed is greater than zero.
- Customer Detail lists only **Awaiting Payment** and **Paid** invoices. Draft, Awaiting Approval, and Voided invoices are not listed. Invoices are ordered oldest date first, then by ID.
- The receivable begins when a sale is approved: Sales posts a debit to Accounts Receivable control account `600` and credits the selected Revenue Account(s). This is the invoice-side General Ledger posting; sale approval does not record customer cash received.
- Invoice payment status is displayed as **Paid** when no balance remains, **Partial** when some amount has been paid, and **Unpaid** otherwise.
- The payment dialog is offered only if the listed invoices have a positive total outstanding balance. The deposit account list is drawn from Chart of Accounts asset accounts; registered bank accounts additionally show the optional Check Number field.
- Receipts are allocated FIFO across open invoices. A fully covered invoice becomes **Paid**; an invoice with a remaining balance stays **Awaiting Payment**. Each invoice allocation is saved in `sale_payments` and can be reviewed by expanding its paid amount.
- The server validates the amount against outstanding invoices and reports the actual amount allocated. Each receipt also posts a debit to the selected deposit account and a credit to Accounts Receivable control account `600` in the General Ledger.
