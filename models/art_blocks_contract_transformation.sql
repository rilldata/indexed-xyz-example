WITH 

Transformation AS 
(
SELECT 
  CONCAT('https://etherscan.io/tx/', transaction_hash) AS etherscan_tx_hash_url,
  CONCAT('https://etherscan.io/address/', address) AS etherscan_address_url, 
  CONCAT(
    STRING_SPLIT(event_signature, '(')[1], 
    ' - ',
    LENGTH(REGEXP_SPLIT_TO_ARRAY(STRING_SPLIT(event_signature, '(')[2], ','))
    ) AS event_type,
    
    --enrich with topics list parsed to columns from topics
    REGEXP_SPLIT_TO_ARRAY(
        REPLACE(REPLACE(REPLACE(topics, '[',''),']', ''),'"',''),
   ',') AS topics_list,

  *, 
FROM indexed_xyz_contract_raw
)

SELECT 
  * EXCLUDE(topics_list), 

  --only count for transfers 
  CASE WHEN event_type = 'Transfer - 3' THEN topics_list[1] ELSE NULL END AS recipient, 
  CASE WHEN event_type = 'Transfer - 3' THEN topics_list[2] ELSE NULL END AS sender,
  CASE WHEN event_type = 'Transfer - 3' THEN topics_list[3] ELSE NULL END AS token 
FROM Transformation


