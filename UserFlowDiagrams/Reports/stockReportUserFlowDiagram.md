# Stock Report — User Flow

**Access:** The Reports sidebar shows Stock Report to roles with the `manage_stockreport` permission.

The page is a hub. Each card opens a report on the same page, except Mc Report, which opens the Mc Reports screen.

## 1. Choose a stock report

```mermaid
flowchart TD
    A[Open Reports in sidebar] --> B[Open Stock Report]
    B --> C[Show five report cards]
    C -->|HHK Loose| D[Open HHK Loose]
    C -->|HHK Balance| E[Open HHK Balance]
    C -->|GFC Loose| F[Open GFC Loose]
    C -->|GFC Balance| G[Open GFC Balance]
    C -->|Mc Report| H[Open Mc Reports]
    D --> I[Select Back to return to the card hub]
    E --> I
    F --> I
    G --> I
```

## 2. HHK Loose or GFC Loose

```mermaid
flowchart TD
    A[HHK Loose or GFC Loose] --> B[Optionally select a commodity already on that stock]
    B --> C{Choose Loose In or Loose Out}
    C -->|Loose In| D[Select]
    C -->|Loose Out| E[Select]
    C -->|Leave direction blank| F[Select shows no table]
    D --> G[List commodity, country, size, kg, and pcs for loose-in rows]
    E --> H[List commodity, country, size, kg, and pcs for loose-out rows]
    G --> I[HHK reads HHK Mc stock; GFC reads GFC Mc stock]
    H --> I
    B -->|Leave commodity blank| J[Include every commodity for the chosen direction]
    J --> D
    J --> E
```

## 3. HHK Balance or GFC Balance

```mermaid
flowchart TD
    A[HHK Balance or GFC Balance] --> B[Table loads immediately]
    B --> C[Optionally select a commodity and Select]
    C --> D[Group rows by commodity and size]
    D --> E[Hide a row when its Mc balance is zero]
    E --> F[Show commodity, country, size, kg, and Mc]
    F --> G[Show footer totals for displayed Kg and Mc]
    A --> H{Which balance?}
    H -->|HHK Balance| I[Mc is stock not marked to, minus stock marked to]
    H -->|GFC Balance| J[Mc is HHK to GFC, minus every other GFC particular]
```

## 4. Mc Report

```mermaid
flowchart TD
    A[Select Mc Report card] --> B[Open Mc Reports]
    B --> C[Show a country tab for each country on HHK or GFC Mc stock]
    C --> D[Select a country tab]
    D --> E[Commodity and fish type lists follow the selected country]
    E --> F{Choose a view}
    F -->|Leave commodity on View Each Commodity and select View| G[Show all fish for that country]
    F -->|Choose a commodity and a fish type, then View| H[Show that commodity and fish type for that country]
    G --> I[Table columns: No, Fish Name, Country, Size, Kg, HHK Mc, GFC Mc, Total Mc]
    H --> I
    I --> J[Select Excel Report to export the Mc stock report]
    B --> K[Select Date Search]
    K --> L[Open the dated Mc report]
    L --> M[Select Filter With Date]
    M --> N[Choose country, Date From, and Date To]
    N --> O[Select Search]
    O --> P[Show Mc stock inside that date range]
    P --> Q[Select Excel Report to export the dated result]
    P --> R[Select Clear to reset the date filter]
    L --> S[Select Back to return to Mc Reports]
```
