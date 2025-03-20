drop database if exists media_database;
create database media_database;
use media_database;
CREATE TABLE media (
    id INT AUTO_INCREMENT PRIMARY KEY,
    file_name VARCHAR(255) NOT NULL,
    file_type VARCHAR(50) NOT NULL,
    file_data LONGBLOB
);

INSERT INTO media (file_name, file_type, file_data) 
VALUES
('example.mp3', 'audio/mpeg', LOAD_FILE('C:/Users/l/Downloads/good 2.mp3')),
('example.image', 'image/jpeg', LOAD_FILE('C:/Users/l/Downloads/enemy_Car.png'));
    
select * from media;   
-- if data is not being inserted inside the musql check below path and keep
-- your files inside this folder
SHOW VARIABLES LIKE 'secure_file_priv'; 
-- 'secure_file_priv', 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\'
-- change path to \: 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\yourfile.jpg'

INSERT INTO media (file_name, file_type, file_data) 
VALUES
('example.mp3', 'audio/mpeg', LOAD_FILE('C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\good 2.mp3')),
('example.image', 'image/jpeg', LOAD_FILE('C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\road.png'));

-- truncate table media;
-- select * from media;

SELECT file_name, file_type, LENGTH(file_data) AS file_size FROM media;

SHOW GRANTS FOR CURRENT_USER;

GRANT FILE ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

SELECT LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/good 2.mp3') AS test_file;




