CREATE TABLE Users (
    user_id varchar(255) PRIMARY KEY,
    Password varchar(255),
    Name varchar(255),
    Email varchar(255),
    Phone varchar(255)
);


INSERT INTO Users (user_id, Password, Name, Email, Phone)  
   VALUES ('user1', 'password', 'TestUser', 'testuser@relevel.com', '7777000055');
INSERT INTO Users (user_id, Password, Name, Email, Phone)  
   VALUES ('user2', 'password2', 'TestUser2', 'testuser2@relevel.com', '8899554712');


CREATE TABLE Measurements (
    measurement_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id varchar(255) references Users(user_id),
    weight DECIMAL,
    caloric_intake INTEGER,
    neck_in_cms DECIMAL,
    shoulders_in_cms DECIMAL,
    chest_in_cms DECIMAL,
    waist_in_cms DECIMAL,
    edited_timestamp timestamp
);

INSERT INTO Measurements (user_id, weight, edited_timestamp)  
   VALUES ('user1', 97.6, '2021-12-16 10:20:20.000');
INSERT INTO Measurements (user_id, weight, edited_timestamp)
    VALUES ('user1', 97, '2021-12-17 10:20:20.000');
INSERT INTO Measurements (user_id, weight, edited_timestamp)
    VALUES ('user1', 96.2, '2021-12-18 10:20:20.000');


CREATE TABLE Exercises (
    exercise_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    exercise_name varchar(255),
    category varchar(255),
    body_part varchar(255)
);


INSERT INTO Exercises (exercise_name, category, body_part)  
   VALUES ('Squat', 'Machine', 'Legs');
INSERT INTO Exercises (exercise_name, category, body_part)  
   VALUES ('Lying Leg Curl', 'Machine', 'Legs');
INSERT INTO Exercises (exercise_name, category, body_part)  
    VALUES ('Deadlift', 'Barbell', 'Back');
INSERT INTO Exercises (exercise_name, category, body_part)  
    VALUES ('Lat Pulldown - Underhand', 'Weighted bodyweight', 'Back');
INSERT INTO Exercises (exercise_name, category, body_part)  
    VALUES ('Back Extension', 'Machine', 'Back');
INSERT INTO Exercises (exercise_name, category, body_part)  
    VALUES ('Bench Press', 'Barbell', 'Chest');
INSERT INTO Exercises (exercise_name, category, body_part)  
    VALUES ('Bench Press - Dumbbell', 'Dumbbell', 'Chest');
INSERT INTO Exercises (exercise_name, category, body_part)  
    VALUES ('Front Raise', 'Barbell', 'Shoulders');
INSERT INTO Exercises (exercise_name, category, body_part)  
    VALUES ('Burpee', 'Weighted bodyweight', 'Full body');


CREATE TABLE Workouts (
    workout_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id varchar(255) references Users(user_id),
    workout_name varchar(255),
	start_timestamp timestamp,
	end_timestamp timestamp,
	additional_notes varchar(255)
);


INSERT INTO Workouts (user_id, workout_name, start_timestamp, end_timestamp, additional_notes)  
   VALUES ('user1', 'leg day', '2021-12-14 09:00:00.000', '2021-12-14 10:20:00.000', 'lower back and leg');

INSERT INTO Workouts (user_id, workout_name, start_timestamp, end_timestamp)  
    VALUES ('user1', 'chest day', '2021-12-15 09:10:00.000', '2021-12-15 09:50:00.000');



CREATE TABLE Exercise_Performed (
    exercise_performed_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    workout_id INTEGER references Workouts(workout_id),
    exercise_id INTEGER references Exercises(exercise_id),
	additional_notes varchar(255)
);


INSERT INTO Exercise_Performed (workout_id, exercise_id, additional_notes)  
    VALUES (1, 1, 'with support');

INSERT INTO Exercise_Performed (workout_id, exercise_id)  
    VALUES (1, 3);

INSERT INTO Exercise_Performed (workout_id, exercise_id, additional_notes)  
    VALUES (2, 6, 'inclined');

INSERT INTO Exercise_Performed (workout_id, exercise_id)  
    VALUES (2, 7);
    
    
CREATE TABLE Sets (
    exercise_performed_id INTEGER references Exercise_Performed(exercise_performed_id),
    weight DECIMAL,
    reps INTEGER
);

INSERT INTO Sets (exercise_performed_id, weight, reps)  
    VALUES (1, 10, 10);
INSERT INTO Sets (exercise_performed_id, weight, reps)  
    VALUES (1, 12.5, 8);
INSERT INTO Sets (exercise_performed_id, weight, reps)  
    VALUES (1, 15, 6);
INSERT INTO Sets (exercise_performed_id, weight, reps)  
    VALUES (2, 15, 10);
INSERT INTO Sets (exercise_performed_id, weight, reps)  
    VALUES (2, 17.5, 8);
INSERT INTO Sets (exercise_performed_id, weight, reps)  
    VALUES (2, 20, 6);
INSERT INTO Sets (exercise_performed_id, weight, reps)  
    VALUES (3, 12.5, 10);
INSERT INTO Sets (exercise_performed_id, weight, reps)  
    VALUES (3, 15, 6);
INSERT INTO Sets (exercise_performed_id, weight, reps)  
    VALUES (4, 15, 8);
INSERT INTO Sets (exercise_performed_id, weight, reps)  
    VALUES (4, 20, 6);
    
    
    