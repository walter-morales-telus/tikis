select 1 from dual where 7 <> 
(
    SELECT COUNT(*) FROM nc_params WHERE 
    attr_id = 9152691259713493756 
    AND 
    list_value_id = 7777001
    AND 
    object_id IN 
    (
        9162124824137604376,
        9163929368250659186,
        9162124816233604373,
        9161505375504984302,
        9162124821861523962,
        9161482789519984292,
        9161505364504984297
    )
);