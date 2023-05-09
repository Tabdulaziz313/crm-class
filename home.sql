

CREATE DATABASE home6;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
SELECT uuid_generate_v4();

------------------------------- cars -------------------------------



CREATE TABLE cars(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   color VARCHAR NOT NULL,
   price INT NOT NULL
);


CREATE TABLE carsInsert(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   color VARCHAR NOT NULL,
   price INT NOT NULL
);



CREATE TABLE updateCars(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   color VARCHAR NOT NULL,
   price INT NOT NULL,
   new_price INT NOT NULL,
);


CREATE TABLE deleteCar(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   color VARCHAR NOT NULL,
   price INT NOT NULL
);





-- Triger InSert

CREATE OR REPLACE FUNCTION carsInsertFunc() 
RETURNS TRIGGER 
AS $create_car$
   BEGIN
      INSERT INTO carsInsert(id, title, color, price) 
      VALUES (new.id, new.title, new.color, new.price);
      RETURN new;
   END;
$create_car$ LANGUAGE plpgsql;


CREATE TRIGGER car_insert_trigger AFTER INSERT ON cars
FOR EACH ROW EXECUTE PROCEDURE carsInsertFunc();


-- Triger Update

CREATE OR REPLACE FUNCTION updateCarsFunc() 
RETURNS TRIGGER 
AS $update_car$
   BEGIN
      INSERT INTO updateCars(id, old_title, new_title, color, price) 
      VALUES (old.id, old.title, new.color, old_price ,new.price);
      RETURN new;
   END;
$update_car$ LANGUAGE plpgsql;

 
CREATE TRIGGER car_update_trigger AFTER UPDATE ON cars
FOR EACH ROW EXECUTE PROCEDURE updateCarsFunc();


-- Triger Daleted

REATE OR REPLACE FUNCTION deleteCarFunc() 
RETURNS TRIGGER 
AS $delete_car$
   BEGIN
      INSERT INTO deleteCar(id, title, color, price) 
      VALUES (old.id, old.title, old.color, old.price);
      RETURN old;
   END;
$delete_car$ LANGUAGE plpgsql;

CREATE TRIGGER car_delete_trigger AFTER DELETE ON cars
FOR EACH ROW EXECUTE PROCEDURE deleteCarFunc(); 


-------------------------------course -------------------------------


CREATE TABLE courses(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   price INT NOT NULL,
   teacher_name VARCHAR NOT NULL
);


CREATE TABLE courseInsert(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   price INT NOT NULL,
   teacher_name VARCHAR NOT NULL
);


CREATE TABLE updateCourse(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   old_title VARCHAR NOT NULL,
   new_title VARCHAR NOT NULL,
   price INT NOT NULL,
   teacher_name VARCHAR NOT NULL
);


CREATE TABLE deleteCourse(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   price INT NOT NULL,
   teacher_name VARCHAR NOT NULL
);


-- Triger InSert


CREATE OR REPLACE FUNCTION courseInsertFunc() 
RETURNS TRIGGER 
AS $create_course$
   BEGIN
      INSERT INTO courseInsert(id, title, price, teacher_name) 
      VALUES (new.id, new.title, new.price, new.teacher_name);
      RETURN new;
   END;
$create_course$ LANGUAGE plpgsql;

CREATE TRIGGER course_insert_trigger AFTER INSERT ON courses
FOR EACH ROW EXECUTE PROCEDURE courseInsertFunc();

-- Triger Update



CREATE OR REPLACE FUNCTION updateCourseFunc() 
RETURNS TRIGGER 
AS $update_course$
   BEGIN
      INSERT INTO updateCourse(id, old_title, new_title, price, teacher_name) 
      VALUES (old.id, old.title, new.title, new.price, new.teacher_name);
      RETURN new;
   END;
$update_course$ LANGUAGE plpgsql;
 
CREATE TRIGGER course_update_trigger AFTER UPDATE ON courses
FOR EACH ROW EXECUTE PROCEDURE updateCourseFunc();


-- Triger Daleted


CREATE TABLE deleteCourse(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   price INT NOT NULL,
   teacher_name VARCHAR NOT NULL
);

CREATE OR REPLACE FUNCTION deleteCourseFunc() 
RETURNS TRIGGER 
AS $delete_course$
   BEGIN
      INSERT INTO deleteCourse(id, title, price, teacher_name) 
      VALUES (old.id, old.title, old.price, old.teacher_name);
      RETURN old;
   END;
$delete_course$ LANGUAGE plpgsql;

CREATE TRIGGER course_delete_trigger AFTER DELETE ON courses
FOR EACH ROW EXECUTE PROCEDURE deleteCourseFunc(); 





-------------------------------animals-------------------------------

CREATE TABLE animals(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   type VARCHAR NOT NULL,
   count INT NOT NULL
);

CREATE TABLE animalsInsert(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   type VARCHAR NOT NULL,
   count INT NOT NULL
);
 

 CREATE TABLE updateAnimals(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   old_title VARCHAR NOT NULL,
   new_title VARCHAR NOT NULL,
   type VARCHAR NOT NULL,
   count INT NOT NULL
);


CREATE TABLE deleteAnimals(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   type VARCHAR NOT NULL,
   count INT NOT NULL
);



-- Triger InSert

CREATE OR REPLACE FUNCTION animalsInsertFunc() 
RETURNS TRIGGER 
AS $create_animal$
   BEGIN
      INSERT INTO animalsInsert(id, title, type, count) 
      VALUES (new.id, new.title, new.type, new.count);
      RETURN new;
   END;
$create_animal$ LANGUAGE plpgsql;

CREATE TRIGGER animals_insert_trigger AFTER INSERT ON animals
FOR EACH ROW EXECUTE PROCEDURE animalsInsertFunc();

-- Triger Update


CREATE OR REPLACE FUNCTION updateAnimalsFunc() 
RETURNS TRIGGER 
AS $update_animals$
   BEGIN
      INSERT INTO updateAnimals(id, old_title, new_title, type, count) 
      VALUES (old.id, old.title, new.title, new.type, new.count);
      RETURN new;
   END;
$update_animals$ LANGUAGE plpgsql;
 
CREATE TRIGGER animals_update_trigger AFTER UPDATE ON animals
FOR EACH ROW EXECUTE PROCEDURE updateAnimalsFunc();

-- Triger Daleted


CREATE OR REPLACE FUNCTION deleteAniamlsFunc() 
RETURNS TRIGGER 
AS $delete_animal$
   BEGIN
      INSERT INTO deleteAnimals(id, title, type, count) 
      VALUES (old.id, old.title, old.type, old.count);
      RETURN old;
   END;
$delete_animal$ LANGUAGE plpgsql;

CREATE TRIGGER animals_delete_trigger AFTER DELETE ON animals
FOR EACH ROW EXECUTE PROCEDURE deleteAniamlsFunc(); 



-------------------------------fruits-------------------------------

CREATE TABLE fruits(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   price INT NOT NULL,
   description VARCHAR NOT NULL
);

CREATE TABLE fruitsInsert(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   price INT NOT NULL,
   description VARCHAR NOT NULL
);


CREATE TABLE updateFruits(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   old_title VARCHAR NOT NULL,
   new_title VARCHAR NOT NULL,
   price INT NOT NULL,
   description VARCHAR NOT NULL
);
 


 CREATE TABLE deleteFruit(
   id VARCHAR UNIQUE NOT NULL DEFAULT uuid_generate_v4(),
   title VARCHAR NOT NULL,
   price INT NOT NULL,
   description VARCHAR NOT NULL
);





-- Triger InSert


CREATE OR REPLACE FUNCTION fruitsInsertFunc() 
RETURNS TRIGGER 
AS $create_fruit$
   BEGIN
      INSERT INTO fruitsInsert(id, title, price, description) 
      VALUES (new.id, new.title, new.price, new.description);
      RETURN new;
   END;
$create_fruit$ LANGUAGE plpgsql;

CREATE TRIGGER fruits_insert_trigger AFTER INSERT ON fruits
FOR EACH ROW EXECUTE PROCEDURE fruitsInsertFunc();

-- Triger Update


CREATE OR REPLACE FUNCTION updateFruitsFunc() 
RETURNS TRIGGER 
AS $update_fruit$
   BEGIN
      INSERT INTO updateFruits(id, old_title, new_title, price, description) 
      VALUES (old.id, old.title, new.title, new.price, new.description);
      RETURN new;
   END;
$update_fruit$ LANGUAGE plpgsql;
 
CREATE TRIGGER fruits_update_trigger AFTER UPDATE ON fruits
FOR EACH ROW EXECUTE PROCEDURE updateFruitsFunc();
-- Triger Daleted


CREATE OR REPLACE FUNCTION deleteFruitFunc() 
RETURNS TRIGGER 
AS $delete_fruit$
   BEGIN
      INSERT INTO deleteFruit(id, title, price, description) 
      VALUES (old.id, old.title, old.price, old.description);
      RETURN old;
   END;
$delete_fruit$ LANGUAGE plpgsql;

CREATE TRIGGER fruit_delete_trigger AFTER DELETE ON fruits
FOR EACH ROW EXECUTE PROCEDURE deleteFruitFunc(); 