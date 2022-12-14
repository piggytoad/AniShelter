CREATE DATABASE animalDB;
CREATE USER 'webapp'@'%';
GRANT ALL PRIVILEGES ON animalDB.* TO 'webapp'@'%';
FLUSH PRIVILEGES;

USE animalDB;

CREATE TABLE Adopter
(
    id  INTEGER,
    firstName  TEXT,
    lastName    TEXT,
    phoneNumber INTEGER,
    address TEXT,
    animalAdopt INTEGER,
    uploadPost  INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (animalAdopt) REFERENCES Animal(id),
    FOREIGN KEY (uploadPost) REFERENCES Post(id)
);

INSERT INTO Adopter (id, firstName, lastName, phoneNumber, address, animalAdopt, uploadPost) VALUES
(1, 'Sapphira', 'Jelks', '5436591861', '179 Westend Pass', 5, NULL), 
(2, 'Mallory', 'Opy', '8671723123', '61 Pine View Circle', 7, NULL),
(3, 'Jolee', 'Coysh', '3948141759', '51 Montana Terrace', NULL, 1),
(4, 'Nolie', 'Gorler', '9815213154', '2721 Calypso Alley', NULL, 9),
(5, 'Allie', 'Cornehl', '1466676905', '5 Cardinal Street', NULL, 5),
(6, 'Bernardina', 'Brandacci', '3025078878', '6208 Coolidge Hill', 4, NULL),
(7, 'Colas', 'Janda', '2243975011', '080 Lunder Hill', NULL, 3),
(8, 'Frazier', 'Frewer', '4844103222', '5680 Manley Center', NULL, 6),
(9, 'Daryle', 'Hamshere', '3616995936', '29 Toban Parkway', 6, 8);

CREATE TABLE Animal
(
    id  INTEGER,
    name    TEXT,
    type    TEXT,
    breed   TEXT,
    isVaccinated    TEXT,
    PRIMARY KEY (id)
);

INSERT INTO Animal (id, name, type, breed, isVaccinated) VALUES 
(1, 'Dulcie', 'Dog', 'Bulldog', 'true'),
(2, 'Cammie', 'Dog', 'Poodle', 'false'),
(3, 'Grover', 'Cat', 'Scottish Fold', 'true'),
(4, 'Tamera', 'Dog', 'German Fold', 'true'),
(5, 'Micky', 'Dog', 'Pit Bull', 'false'),
(6, 'Nonie', 'Cat', 'Ragdoll', 'false'),
(7, 'Fleur', 'Dog', 'Labrador', 'true'),
(8, 'Shurwood', 'Dog', 'Labrador', 'true'),
(9, 'Lise', 'Cat', 'Bombay', 'false'),
(10, 'Joelly', 'Cat', 'British Short Hair', 'false');

CREATE TABLE Post
(
    id  INTEGER,
    time    TEXT,
    date    TEXT,
    PRIMARY KEY (id)
);

INSERT INTO Post (id, time, date) VALUES 
(1, '10:15 PM', '12/20/2021'),
(2, '7:51 PM', '9/23/2022'),
(3, '12:44 AM', '3/21/2022'),
(4, '8:20 AM', '9/3/2022'),
(5, '8:59 AM', '1/14/2022'),
(6, '3:57 AM', '6/27/2022'),
(7, '4:40 AM', '10/30/2022'),
(8, '1:51 PM', '10/16/2022'),
(9, '5:48 PM', '3/19/2022');

CREATE TABLE Staff
(
    id  INTEGER,
    firstName   TEXT,
    lastName    TEXT,
    phoneNumber INTEGER,
    email   TEXT,
    volunteerRep    INTEGER,
    idAssign    TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (volunteerRep) REFERENCES Volunteer(id),
    FOREIGN KEY (idAssign) REFERENCES UnregisteredAnimal(Name)
);


INSERT INTO Staff (id, firstName, lastName, phoneNumber, email, volunteerRep, idAssign) VALUES 
(1, 'Aldon', 'Darrigone', '3113459192', 'adarrigone0@fotki.com', 4, 'Quinton'),
(2, 'Janeczka', 'Glasscoe', '1705268806', 'jglasscoe1@umn.edu', 3, 'Carver'),
(3, 'Maxie', 'Luty', '4461006332', 'mluty2@newyorker.com', 1, 'Vanya'),
(4, 'Fancy', 'Wallenger', '9096000676', 'fwallenger3@mashable.com', 2, 'Luella'),
(5, 'Gillie', 'McCready', '6553282951', 'gmccready4@tmall.com', 5, 'Kerby'),
(6, 'Conroy', 'Vere', '3318114083', 'cvere5@usa.gov', 7, 'Ulysses'),
(7, 'Isaac', 'Sadd', '9067477294', 'isadd6@auda.org.au', 6, NULL),
(8, 'Sibilla', 'Bradlaugh', '5108494277', 'sbradlaugh7@reuters.com', 8, NULL),
(9, 'Bartie', 'Sottell', '2418104141', 'bsottell8@hc360.com', 9, NULL);

CREATE TABLE Volunteer
(
    id  INTEGER,
    firstName   TEXT,
    lastName    TEXT,
    phoneNumber INTEGER,
    email   TEXT,
    scheduleTimeSlot    INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY (scheduleTimeSlot) REFERENCES TimeSlot(number)
);

INSERT INTO Volunteer (id, firstName, lastName, phoneNumber, email, scheduleTimeSlot) VALUES 
(1, 'Brig', 'Guidini', '6332187744', 'bguidini0@sciencedirect.com', 6), 
(2, 'Shelley', 'Zannetti', '3014966824', 'szannetti1@51.la', 6),
(3, 'Bertrand', 'Davydoch', '9441859740', 'bdavydoch2@gnu.org', 7),
(4, 'Noellyn', 'Adam', '8375958989', 'nadam3@github.com', 5),
(5, 'Larine', 'Roll', '9289166363', 'lroll4@sogou.com', 8),
(6, 'Griffin', 'Castello', '1469689726', 'gcastello5@businessinsider.com', 7),
(7, 'Charity', 'Benkhe', '6196903292', 'cbenkhe6@360.cn', 7),
(8, 'Ingaborg', 'Carrel', '5488039158', 'icarrel7@bing.com', 1),
(9, 'Niall', 'Boreham', '5461916571', 'nboreham8@toplist.cz', 9);

CREATE TABLE TimeSlot
(
    number  INTEGER,
    time    TEXT,
    date    TEXT,
    PRIMARY KEY (number)
);

INSERT INTO TimeSlot (number, time, date) VALUES 
(1, '12:49 PM', '6/26/2022'),
(2, '6:15 PM', '4/22/2022'),
(3, '3:31 PM', '4/25/2022'),
(4, '7:54 PM', '10/8/2022'),
(5, '8:32 AM', '2/5/2022'),
(6, '8:41 AM', '6/11/2022'),
(7, '8:33 AM', '3/24/2022'),
(8, '10:47 AM', '10/23/2022'),
(9, '9:03 PM', '12/11/2022');

CREATE TABLE Owner
(
    id  INTEGER,
    firstName   TEXT,
    lastName    TEXT,
    phoneNumber INTEGER,
    email   TEXT,
    ownedAnimal TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (ownedAnimal) REFERENCES UnregisteredAnimal(name)
);

INSERT INTO Owner (id, firstName, lastName, phoneNumber, email, ownedAnimal) VALUES 
(1, 'Jimmy', 'Gladtbach', '8965035304', 'jgladtbach0@freewebs.com', 'Quinton'),
(2, 'Rayna', 'Cadney', '9189512154', 'rcadney1@xrea.com', 'Ulysses'),
(3, 'Cherianne', 'Taaffe', '2508528357', 'ctaaffe2@comcast.net', 'Carver'),
(4, 'Mac', 'Tyson', '5812646181', 'mtyson3@usa.gov', 'Suzette'),
(5, 'Felice', 'Charity', '6575318089', 'fcharity4@aol.com', 'Kerby'),
(6, 'Elliot', 'Chsteney', '4244988969', 'echsteney5@addtoany.com', 'Vanya'),
(7, 'Dunc', 'Maddy', '7911892001', 'dmaddy6@nps.gov', 'Luella'),
(8, 'Timothy', 'Rotge', '2545099626', 'trotge7@chicagotribune.com', 'Ashien');

CREATE TABLE UnregisteredAnimal
(
    name    TEXT,
    type    TEXT,
    breed   TEXT,
    isVaccinated    TEXT,
    PRIMARY KEY (name)
);

INSERT INTO UnregisteredAnimal (name, type, breed, isVaccinated) VALUES 
('Quinton', 'Dog', 'Golden Retriever', 'true'),
('Carver', 'Cat', 'Siamese', 'false'),
('Suzette', 'Cat', 'Persian', 'false'),
('Ashien', 'Dog', 'German Shephard', 'true'),
('Ulysses', 'Cat', 'Scottish Fold', 'true'),
('Kerby', 'Cat', 'Birman', 'true'),
('Luella', 'Rabbit', 'Chinchilla', 'true'),
('Vanya', 'Dog', 'Chihuahua', 'true');

CREATE TABLE meeting
(
    staffID INTEGER,
    ownerID INTEGER,
    time    TEXT,
    date    TEXT,
    FOREIGN KEY (staffID) REFERENCES Staff(id),
    FOREIGN KEY (ownerID) REFERENCES Owner(id)
);

INSERT INTO meeting (staffID, ownerID, time, date) VALUES 
(1, 4, '9:13 PM', '1/14/2022'),
(1, 6, '6:48 PM', '10/14/2022'),
(4, 8, '8:22 AM', '6/12/2022'),
(4, 7, '3:24 PM', '1/27/2022');

CREATE TABLE work_with
(
    volunteerID INTEGER,
    animalID    INTEGER,
    numOfhrs    INTEGER,
    FOREIGN KEY (volunteerID) REFERENCES Volunteer(id),
    FOREIGN KEY (animalID) REFERENCES Animal(id)
);

INSERT INTO work_with (volunteerID, animalID, numOfhrs) VALUES 
(1, 4, 1),
(2, 3, 0.5),
(2, 5, 0.1),
(6, 5, 1.5);