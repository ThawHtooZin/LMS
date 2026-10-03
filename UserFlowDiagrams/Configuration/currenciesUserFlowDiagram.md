# Currencies User Flow Diagram

```mermaid
flowchart TD
    A[User with Manage Currency access] --> B[Open Configuration]
    B --> C[Open Currencies]
    C --> D[Choose date for exchange rates]
    D --> E[View active currencies and rates for that date]
    E --> E1[Rates are expressed in MMK]
    E --> F{Choose an action}

    F -->|Add currency| G[Select from the available currency list]
    G --> G1{Currency already active?}
    G1 -->|Yes| G2[Show already-added error]
    G1 -->|No| G3[Add currency to active list]
    G3 --> G4[Show success and refresh list]
    G4 --> E
    G2 --> E

    F -->|Enter or update rates| H[Enter rates for the selected date]
    H --> H1[Leave a field empty to skip saving that currency's rate]
    H1 --> H2[Save Rates]
    H2 --> H3[Insert or update rates for the selected date]
    H3 --> H4[Show save confirmation and return to selected date]
    H4 --> E

    F -->|Delete currency| I[Confirm deletion]
    I -->|Cancel| E
    I -->|Confirm| J[Delete active currency]
    J --> J1[Delete all exchange-rate history for that currency]
    J1 --> J2[Show success and refresh list]
    J2 --> E
```

## Quick guide

- The page manages **active currencies** and their exchange rates against **MMK**. Select the date first; rates shown and saved are for that date.
- Add currencies only from the list provided by the application. A currency already active cannot be added again.
- Enter the applicable rate for each currency, then select **Save Rates**. Existing rates for that date are updated; missing rates for that date are inserted. Empty rate fields are skipped rather than saved.
- Deleting a currency removes it from the active list **and permanently deletes its exchange-rate history**. Confirm this is intended before deleting.
- The sidebar displays this page to roles with the `manage_currency` permission.
