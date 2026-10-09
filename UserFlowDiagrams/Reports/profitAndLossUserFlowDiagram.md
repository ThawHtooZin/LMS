# Profit and Loss — User Flow

**Access:** The Reports sidebar shows Profit and Loss to roles with the `profit_loss_report` permission.

The statement covers the chosen date range. On first open, the range is the first day of the current month through today. Income is credit minus debit. Cost of sales and expenses are debit minus credit. Gross Profit is trading income minus cost of sales. Net Profit is gross profit minus operating expenses and any uncategorized expense lines. A negative net profit is shown in parentheses.

Accounts are placed by chart-of-accounts class and type:

- Trading Income: Revenue, Income, or Sales
- Cost of Sales: Direct Costs, Cost of Sales, COGS, or Purchase
- Operating Expenses: Expense, Operating, or Overhead
- Uncategorized: remaining ledger movement on account codes starting with 5, 6, 8, or 9

Asset, liability, and payable codes are left out of the statement. A section with no movement shows an empty message for that section. The Uncategorized section appears only when such accounts have movement.

## 1. Open the statement

```mermaid
flowchart TD
    A[Open Reports in sidebar] --> B[Open Profit and Loss]
    B --> C[Load the current month through today]
    C --> D[Show Link Mark System and the period heading]
    D --> E[List Trading Income accounts and Total Trading Income]
    E --> F[List Cost of Sales accounts and Total Cost of Sales]
    F --> G[Show Gross Profit]
    G --> H[List Operating Expenses and Total Operating Expenses]
    H --> I{Any uncategorized 5, 6, 8, or 9 accounts?}
    I -->|Yes| J[List them and Total Uncategorized]
    I -->|No| K[Skip that section]
    J --> L[Show Net Profit]
    K --> L
```

## 2. Change the period

```mermaid
flowchart TD
    A[Profit and Loss is on screen] --> B[Change Date range start and end]
    B --> C[Select Update]
    C --> D[Rebuild every section for the new period]
    D --> E[Update the period heading and the month labels]
```

## 3. Export control

```mermaid
flowchart TD
    A[Profit and Loss is on screen] --> B[Select Export]
    B --> C[The button does not download or print the statement]
```
