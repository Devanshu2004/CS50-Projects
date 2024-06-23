-- *** The Lost Letter ***
SELECT * FROM scans
WHERE package_id = (
    SELECT id FROM packages
    WHERE from_address_id = (
        SELECT id FROM addresses
        WHERE address = '900 Somerville Avenue'
    )
    AND to_address_id = (
        SELECT id FROM addresses
        WHERE address LIKE '2 Finn%'
    )
);

SELECT * FROM addresses
WHERE id = '854';

-- *** The Devious Delivery ***
SELECT * FROM addresses
WHERE id = (
    SELECT address_id FROM scans
    WHERE package_id = (
        SELECT id FROM packages
        WHERE from_address_id IS NULL;
    ) AND action = 'Drop'
);

SELECT * FROM packages
WHERE from_address_id IS NULL;

-- *** The Forgotten Gift ***

SELECT * FROM packages
WHERE from_address_id = (
    SELECT id FROM addresses
    WHERE address = '109 Tileston Street'
);

SELECT name from drivers
WHERE id = (
    SELECT driver_id FROM scans
    WHERE package_id = (
        SELECT id FROM packages
        WHERE from_address_id = (
            SELECT id FROM addresses
            WHERE address = '109 Tileston Street'
        )
    )
    ORDER BY timestamp DESC
    LIMIT 1
);
