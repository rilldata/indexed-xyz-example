SELECT 
  CONCAT('https://etherscan.io/tx/', transaction_hash) AS etherscan_tx_hash_url,
  CONCAT('https://etherscan.io/address/', address) AS etherscan_address_url, 
  CONCAT(
    STRING_SPLIT(event_signature, '(')[1], 
    ' - ',
    LENGTH(REGEXP_SPLIT_TO_ARRAY(STRING_SPLIT(event_signature, '(')[2], ','))
    ) AS event_type,
  *, 
FROM indexed_xyz_contract_raw
-- WHERE address = '{{ address }}'