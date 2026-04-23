DROP PROCEDURE IF EXISTS get_rand;

DELIMITER //

CREATE PROCEDURE get_rand(
    IN seed_val INT,
    IN batch_val INT,
    IN i INT,
    IN key_val VARCHAR(50),
    OUT result BIGINT
)
BEGIN
    SET result = ABS(CRC32(CONCAT(seed_val,'-',batch_val,'-',i,'-',key_val)));
END //

DELIMITER ;


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

    DECLARE fname VARCHAR(50);
    DECLARE lname VARCHAR(50);
    DECLARE email VARCHAR(100);

    DECLARE total_first INT;
    DECLARE total_last INT;

    DECLARE fname_offset INT;
    DECLARE lname_offset INT;

    DROP TEMPORARY TABLE IF EXISTS temp_users;

    CREATE TEMPORARY TABLE temp_users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        full_name VARCHAR(100),
        email VARCHAR(100)
    );

    SELECT COUNT(*) INTO total_first FROM first_names WHERE locale = locale_val;
    SELECT COUNT(*) INTO total_last FROM last_names WHERE locale = locale_val;

    WHILE i < 10 DO

        CALL get_rand(seed_val, batch_val, i, 'fname', rand_num);
        SET fname_offset = rand_num MOD total_first;

        SELECT name INTO fname
        FROM first_names
        WHERE locale = locale_val
        LIMIT 1 OFFSET fname_offset;

        CALL get_rand(seed_val, batch_val, i, 'lname', rand_num);
        SET lname_offset = rand_num MOD total_last;

        SELECT name INTO lname
        FROM last_names
        WHERE locale = locale_val
        LIMIT 1 OFFSET lname_offset;

        SET email = LOWER(CONCAT(fname, '.', lname, '@example.com'));

        INSERT INTO temp_users (full_name, email)
        VALUES (CONCAT(fname, ' ', lname), email);

        SET i = i + 1;

    END WHILE;

    SELECT * FROM temp_users;

END //

DELIMITER ;