-- Directions, must add at least 4 owners, 4 pets, 2 trainers, 6 events coming up in the month 
-- need to generate the following 
-- A list of Owners and Pets showing the owner name, pet name, breed, gender, date of birth
-- A list of Upcoming Training Events showing the date, time, trainer, event type, owner, pet
use mydb;

-- generating 4 owners
INSERT INTO OwnerInformation (OwnerName, NameOfPet, ContactNumber) 
VALUES ('Jonathan Phouminh', 'Shu', 7209369999), ('Alex Pong', 'Nina', 7209998888),
('Alyssa Pong', 'Buddy', 7209998844),('Zach Chom', 'Tetonka', 7201236969)  ;


-- generating 4 pets
INSERT INTO PetInformation (NameOfPet, Breed, Color_Markings, Birthdate, Gender, Neutured_Spayedd, BasicTrainingRegistered, 
							Walk_Train_PlayRegistererd, OffLeashOperationRegistered, OwnerSignature) 
VALUES 
	('Shu', 'Shitsu', 'white', '2015-12-17', 'F', 'T', 'T', 'T', 'T', 'JP'),
    ('Nina', 'Poodle', 'yellow', '2005-09-11', 'M', 'T', 'T', 'T', 'T', 'AP'), 
    ('Buddy', 'GoldenRetriever', 'golden', '2014-01-13', 'M', 'T', 'T', 'T', 'T', 'AP'),
    ('Tetonka', 'yorkie', 'brown', '2009-11-01', 'M', 'T', 'T', 'T', 'T', 'ZC');	



-- add 6 events coming up in the month including
INSERT INTO Events (PetID, RegisterDate, EventName, TrainerName) 
VALUES 
(1, '2020-03-18 19:42:30', 'BasicTraining', 'Shea'),
(1,  '2020-03-18 19:42:30', 'WalkTrainPlay', 'Marie'),
(4,  '2020-03-18 19:42:30', 'BasicTraining', 'Shea'),
(2,  '2020-03-18 19:42:30', 'OffLeashOperation', 'Marie'),
(2, '2020-03-20 19:42:30', 'WalkTrainPlay', 'Shea'),
(3, '2020-03-08 00:42:30', 'BasicTraining', 'Shea');


-- dont run this one
INSERT INTO Events (PetID, OwnerName, RegisterDate, EventName, TrainerName) 
VALUES 
(1, 'Jonathan Phouminh', '2020-03-18 19:42:30', 'BasicTraining', 'Shea'),
(1, 'Jonathan Phouminh', '2020-03-18 19:42:30', 'WalkTrainPlay', 'Marie'),
(4, 'Zach Chom', '2020-03-18 19:42:30', 'BasicTraining', 'Shea'),
(2, 'Alex Pong', '2020-03-18 19:42:30', 'OffLeashOperation', 'Marie'),
(2, 'Alex Pong', '2020-03-20 19:42:30', 'WalkTrainPlay', 'Shea'),
(3, 'Alyssa Pong', '2020-03-08 00:42:30', 'BasicTraining', 'Shea');

-- inserting upcoming events
INSERT INTO Events (PetID, RegisterDate, EventName, TrainerName) 
VALUES 
(-1, '2020-03-30 12:00:00', 'BasicTraining', 'Shea'),
(-1, '2020-03-30 12:00:00', 'BasicTraining', 'Shea');

describe Events;
truncate events;

-- A list of Owners and Pets showing the owner name, pet name, breed, gender, date of birth
SELECT O.OwnerName, P.PetID, P.nameofpet, P.breed, P.gender, P.birthdate
FROM ownerinformation O, petinformation P
WHERE O.nameOfpet = P.nameOfPet;

-- A list of Upcoming Training Events showing the date, time, trainer, event type, owner, pet
SELECT P.nameofpet as 'Pet Name', 
O.ownerName as 'OwnerName', 
E.EventName AS 'UpcomingEvent', 
E.RegisterDate as'DATE / TIME', 
E.TrainerName as 'Trainer'
FROM events E , petinformation P, ownerinformation O
WHERE P.PetID = E.PetID AND P.nameofpet = O.nameofpet;

describe events;
select * from ownerinformation;
select * from petinformation;
select * from events;


