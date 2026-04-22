DROP PROCEDURE IF EXISTS generate_batch;

DELIMITER //

CREATE PROCEDURE generate_batch(
    IN seed_val INT,
    IN batch_val INT,
    IN locale_val VARCHAR(10)
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE rand_num BIGINT;
    DECLARE offset_val INT;

    DECLARE total_first INT;
    DECLARE total_last INT;

    DECLARE fname VARCHAR(50);
    DECLARE lname VARCHAR(50);
    DECLARE email VARCHAR(100);
    DECLARE phone VARCHAR(50);

    DROP TEMPORARY TABLE IF EXISTS temp_users;

    CREATE TEMPORARY TABLE temp_users (
        full_name VARCHAR(100),
        email VARCHAR(100),
        phone VARCHAR(50)
    );

    -- count names
    SELECT COUNT(*) INTO total_first
    FROM first_names
    WHERE locale = locale_val;

    SELECT COUNT(*) INTO total_last
    FROM last_names
    WHERE locale = locale_val;

    WHILE i < 10 DO

        -- FIRST NAME
        SET rand_num = ABS(CRC32(
            CONCAT(seed_val, '-', batch_val, '-', i, '-', locale_val, '-fname')
        ));
        SET offset_val = rand_num MOD total_first;

        SELECT name INTO fname
        FROM first_names
        WHERE locale = locale_val
        LIMIT 1 OFFSET offset_val;

        -- LAST NAME
        SET rand_num = ABS(CRC32(
            CONCAT(seed_val, '-', batch_val, '-', i, '-', locale_val, '-lname')
        ));
        SET offset_val = rand_num MOD total_last;

        SELECT name INTO lname
        FROM last_names
        WHERE locale = locale_val
        LIMIT 1 OFFSET offset_val;

        -- EMAIL (deterministic)
        SET email = LOWER(CONCAT(fname, '.', lname, '@example.com'));

        -- PHONE (deterministic, simple version)
        SET rand_num = ABS(CRC32(
            CONCAT(seed_val, '-', batch_val, '-', i, '-', locale_val, '-phone')
        ));

        SET phone = CONCAT(
            '+1-',
            FLOOR(100 + (rand_num MOD 900)), '-',
            FLOOR(100 + ((rand_num DIV 10) MOD 900)), '-',
            FLOOR(1000 + ((rand_num DIV 100) MOD 9000))
        );

        -- INSERT
        INSERT INTO temp_users VALUES (
            CONCAT(fname, ' ', lname),
            email,
            phone
        );

        SET i = i + 1;

    END WHILE;

    SELECT * FROM temp_users;

END //

DELIMITER ;