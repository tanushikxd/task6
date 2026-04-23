DROP PROCEDURE IF EXISTS get_rand;

DELIMITER //

CREATE PROCEDURE get_rand(
    IN seed_val INT,
    IN batch_val INT,
    IN i INT,
    IN key_val VARCHAR(20),
    OUT result BIGINT
)
BEGIN
    SET result = ABS(CRC32(
        CONCAT(seed_val, '-', batch_val, '-', i, '-', key_val)
    ));
END //

DELIMITER ;


DROP PROCEDURE IF EXISTS generate_batch;

DELIMITER //

CREATE PROCEDURE generate_batch(
    IN seed_val INT,
    IN batch_val INT,
    IN locale_val VARCHAR(10),
    IN batch_size INT
)
BEGIN

    DECLARE address VARCHAR(200);
    DECLARE height INT;
    DECLARE street VARCHAR(100);
    DECLARE city VARCHAR(100);

    DECLARE latitude DOUBLE;
    DECLARE longitude DOUBLE;
    DECLARE u DOUBLE;
    DECLARE v DOUBLE;

    DECLARE i INT DEFAULT 0;
    DECLARE rand_num BIGINT;

    DECLARE total_first INT;
    DECLARE total_last INT;
    DECLARE street_count INT;
    DECLARE city_count INT;

    DECLARE fname VARCHAR(50);
    DECLARE lname VARCHAR(50);
    DECLARE clean_fname VARCHAR(50);
    DECLARE email VARCHAR(100);
    DECLARE phone VARCHAR(50);

    DECLARE fname_offset INT;
    DECLARE lname_offset INT;
    DECLARE street_offset INT;
    DECLARE city_offset INT;
    DECLARE house_number INT;


    SELECT COUNT(*) INTO total_first FROM first_names WHERE locale = locale_val;
    SELECT COUNT(*) INTO total_last FROM last_names WHERE locale = locale_val;
    SELECT COUNT(*) INTO street_count FROM streets WHERE locale = locale_val;
    SELECT COUNT(*) INTO city_count FROM cities WHERE locale = locale_val;

    IF total_first = 0 OR total_last = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'first_names or last_names table is empty';
    END IF;

    DROP TEMPORARY TABLE IF EXISTS temp_users;

    CREATE TEMPORARY TABLE temp_users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        full_name VARCHAR(100),
        email VARCHAR(100),
        phone VARCHAR(50),
        address VARCHAR(200),
        height INT,
        latitude DOUBLE,
        longitude DOUBLE
    );

    WHILE i < batch_size DO

        CALL get_rand(seed_val, batch_val, i*10+1, 'fname', rand_num);
        SET fname_offset = rand_num MOD total_first;

        SELECT name INTO fname
        FROM first_names
        WHERE locale = locale_val
        ORDER BY name
        LIMIT 1 OFFSET fname_offset;

        CALL get_rand(seed_val, batch_val, i*10+2, 'lname', rand_num);
        SET lname_offset = rand_num MOD total_last;

        SELECT name INTO lname
        FROM last_names
        WHERE locale = locale_val
        ORDER BY name
        LIMIT 1 OFFSET lname_offset;

        CALL get_rand(seed_val, batch_val, i*10+3, 'title', rand_num);

        IF locale_val = 'de_DE' THEN
            IF rand_num MOD 3 = 0 THEN
                SET fname = CONCAT('Herr ', fname);
            ELSEIF rand_num MOD 3 = 1 THEN
                SET fname = CONCAT('Frau ', fname);
            END IF;
        ELSE
            IF rand_num MOD 3 = 0 THEN
                SET fname = CONCAT('Mr. ', fname);
            ELSEIF rand_num MOD 3 = 1 THEN
                SET fname = CONCAT('Ms. ', fname);
            END IF;
        END IF;

        SET clean_fname = fname;
        SET clean_fname = REPLACE(clean_fname, 'Mr. ', '');
        SET clean_fname = REPLACE(clean_fname, 'Ms. ', '');
        SET clean_fname = REPLACE(clean_fname, 'Herr ', '');
        SET clean_fname = REPLACE(clean_fname, 'Frau ', '');

        SET email = LOWER(CONCAT(clean_fname, '.', lname, '@example.com'));

        CALL get_rand(seed_val, batch_val, i*10+4, 'phone', rand_num);

        IF locale_val = 'de_DE' THEN
            SET phone = CONCAT(
                '+49-',
                FLOOR(100 + (rand_num MOD 900)), '-',
                FLOOR(1000000 + ((rand_num DIV 10) MOD 9000000))
            );
        ELSE
            SET phone = CONCAT(
                '+1-',
                FLOOR(100 + (rand_num MOD 900)), '-',
                FLOOR(100 + ((rand_num DIV 10) MOD 900)), '-',
                FLOOR(1000 + ((rand_num DIV 100) MOD 9000))
            );
        END IF;

        CALL get_rand(seed_val, batch_val, i*10+5, 'geo1', rand_num);
        SET u = (rand_num MOD 1000000) / 1000000;

        CALL get_rand(seed_val, batch_val, i*10+6, 'geo2', rand_num);
        SET v = (rand_num MOD 1000000) / 1000000;

        SET latitude = DEGREES(ASIN(2 * u - 1));
        SET longitude = DEGREES(2 * PI() * v - PI());

        CALL get_rand(seed_val, batch_val, i*10+7, 'house', rand_num);
        SET house_number = (rand_num MOD 999) + 1;

        IF street_count > 0 THEN
            CALL get_rand(seed_val, batch_val, i*10+8, 'street', rand_num);
            SET street_offset = rand_num MOD street_count;

            SELECT street_name INTO street
            FROM streets
            WHERE locale = locale_val
            ORDER BY street_name
            LIMIT 1 OFFSET street_offset;
        ELSE
            SET street = 'Main St';
        END IF;

        IF city_count > 0 THEN
            CALL get_rand(seed_val, batch_val, i*10+9, 'city', rand_num);
            SET city_offset = rand_num MOD city_count;

            SELECT city_name INTO city
            FROM cities
            WHERE locale = locale_val
            ORDER BY city_name
            LIMIT 1 OFFSET city_offset;
        ELSE
            SET city = 'New York';
        END IF;

        SET address = CONCAT(house_number, ' ', street, ', ', city);

        CALL get_rand(seed_val, batch_val, i*10+10, 'height', rand_num);
        SET height = 150 + (rand_num MOD 50);

        INSERT INTO temp_users (
            full_name, email, phone, address, height, latitude, longitude
        )
        VALUES (
            CONCAT(fname, ' ', lname),
            email,
            phone,
            address,
            height,
            latitude,
            longitude
        );

        SET i = i + 1;

    END WHILE;

    SELECT * FROM temp_users;

END //

DELIMITER ;