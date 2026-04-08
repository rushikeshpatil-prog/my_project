WITH base AS (
    SELECT *,
        (S1_DEMOGRAPHIC_PRESSURES + S2_REFUGEES_AND_IDPS) AS social,
        (E1_ECONOMY + E2_ECONOMIC_INEQUALITY) AS economic,
        (P1_STATE_LEGITIMACY + P2_PUBLIC_SERVICES + P3_HUMAN_RIGHTS) AS political,
        (C1_SECURITY_APPARATUS + C2_FACTIONALIZED_ELITES) AS conflict
    FROM query_result
    WHERE __HEVO__MARKED_DELETED = false
)

SELECT *,
    (social * 0.25 + economic * 0.25 + political * 0.30 + conflict * 0.20) AS risk_index
FROM base;
