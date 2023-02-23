-- @materialize: true

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
  EPOCH_MS(block_time*1000) AS block_datetime,
  CAST(block_number AS VARCHAR) AS block,
  *, 
FROM indexed_xyz_contract_raw
WHERE LOWER(address) = LOWER('0xa7d8d9ef8D8Ce8992Df33D8b8CF4Aebabd5bD270')

)


SELECT 
  *, 

  -- insights only for transfers 
  CASE WHEN event_type = 'Transfer - 3' THEN event_params[1] ELSE NULL END AS recipient, 
  CASE WHEN event_type = 'Transfer - 3' THEN event_params[2] ELSE NULL END AS sender,
  CASE WHEN event_type = 'Transfer - 3' THEN event_params[3] ELSE NULL END AS token 
FROM Transformation


