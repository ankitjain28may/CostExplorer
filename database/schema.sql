/* CREATE TABLE */
CREATE TABLE IF NOT EXISTS clients(
  ID INT(11),
  Name VARCHAR(100)
);
/* INSERT QUERY */
INSERT INTO clients(ID, Name)
VALUES
  (1, 'Avengers');
/* INSERT QUERY */
INSERT INTO clients(ID, Name)
VALUES
  (2, 'Defenders');
/* INSERT QUERY */
INSERT INTO clients(ID, Name)
VALUES
  (3, 'Guardians of the Galaxy');



/* CREATE TABLE */
CREATE TABLE IF NOT EXISTS projects(
  ID INT(11),
  Title VARCHAR(100),
  Client_ID INT(11) UNSIGNED
);
/* INSERT QUERY */
INSERT INTO projects(ID, Title, Client_ID)
VALUES
  (1, 'Project 1', 1);
/* INSERT QUERY */
INSERT INTO projects(ID, Title, Client_ID)
VALUES
  (2, 'Project 2', 1);
/* INSERT QUERY */
INSERT INTO projects(ID, Title, Client_ID)
VALUES
  (3, 'Project 3', 2);
/* INSERT QUERY */
INSERT INTO projects(ID, Title, Client_ID)
VALUES
  (4, 'Project 4', 2);
/* INSERT QUERY */
INSERT INTO projects(ID, Title, Client_ID)
VALUES
  (5, 'Project 5', 2);
/* INSERT QUERY */
INSERT INTO projects(ID, Title, Client_ID)
VALUES
  (6, 'Project 6', 3);



/* CREATE TABLE */
CREATE TABLE IF NOT EXISTS cost_types(
  ID INT(11),
  Name VARCHAR(100),
  Parent_Cost_Type_ID INT(11) UNSIGNED
);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name)
VALUES
  (1, 'Development');
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name)
VALUES
  (2, 'Designing');
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name)
VALUES
  (3, 'Marketing');
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (4, 'Website Development', 1);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (5, 'Mobile App Development', 1);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (6, 'DevOps', 1);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (7, 'Wireframing', 2);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (8, 'UI Design', 2);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (9, 'Brochure Design', 2);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (10, 'Social Media Marketing', 3);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (11, 'Print Media Marketing', 3);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (12, 'Payment Gateway License', 4);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (
    13, 'JavaScript Plugin License',
    4
  );
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (14, 'Google Play Store Fees', 5);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (15, 'Apple App Store Fees', 5);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (16, 'Servers', 6);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (17, 'Domain Name', 6);
/* INSERT QUERY */
INSERT INTO cost_types(ID, Name, Parent_Cost_Type_ID)
VALUES
  (18, 'SSL Certificate', 6);



/* CREATE TABLE */
CREATE TABLE IF NOT EXISTS costs(
  ID INT(11),
  Amount DECIMAL(10, 2),
  Cost_Type_ID INT(11) UNSIGNED,
  Project_ID INT(11) UNSIGNED
);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (1, 259428, 1, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (2, 101824, 2, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (3, 80976, 3, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (4, 169857, 4, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (5, 8709, 5, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (6, 80862, 6, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (7, 51479, 7, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (8, 37204, 8, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (9, 13141, 9, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (10, 39591, 10, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (11, 41385, 11, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (12, 92801, 12, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (13, 77056, 13, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (14, 3412, 14, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (15, 5297, 15, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (16, 75020, 16, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (17, 1217, 17, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (18, 4625, 18, 1);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (19, 274189, 1, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (20, 117198, 2, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (21, 92856, 3, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (22, 205822, 4, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (23, 12132, 5, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (24, 56235, 6, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (25, 72901, 7, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (26, 33750, 8, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (27, 10547, 9, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (28, 53946, 10, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (29, 38910, 11, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (30, 131750, 12, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (31, 74072, 13, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (32, 2585, 14, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (33, 9547, 15, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (34, 50087, 16, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (35, 1463, 17, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (36, 4685, 18, 2);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (37, 320469, 1, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (38, 137880, 2, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (39, 71644, 3, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (40, 253894, 4, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (41, 11924, 5, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (42, 54651, 6, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (43, 82045, 7, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (44, 46000, 8, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (45, 9835, 9, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (46, 45660, 10, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (47, 25984, 11, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (48, 162184, 12, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (49, 91710, 13, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (50, 2596, 14, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (51, 9328, 15, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (52, 48171, 16, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (53, 1550, 17, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (54, 4930, 18, 3);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (55, 287079, 1, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (56, 122860, 2, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (57, 88916, 3, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (58, 215166, 4, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (59, 11030, 5, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (60, 60883, 6, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (61, 82842, 7, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (62, 26713, 8, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (63, 13305, 9, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (64, 47650, 10, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (65, 41266, 11, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (66, 130015, 12, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (67, 85151, 13, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (68, 2341, 14, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (69, 8689, 15, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (70, 55320, 16, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (71, 1399, 17, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (72, 4164, 18, 4);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (73, 339293, 1, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (74, 118560, 2, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (75, 87843, 3, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (76, 257678, 4, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (77, 11908, 5, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (78, 69707, 6, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (79, 80342, 7, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (80, 25483, 8, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (81, 12735, 9, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (82, 47972, 10, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (83, 39871, 11, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (84, 133534, 12, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (85, 124144, 13, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (86, 2083, 14, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (87, 9825, 15, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (88, 63413, 16, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (89, 1437, 17, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (90, 4857, 18, 5);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (91, 282039, 1, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (92, 121840, 2, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (93, 71691, 3, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (94, 202257, 4, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (95, 11990, 5, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (96, 67792, 6, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (97, 78702, 7, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (98, 32707, 8, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (99, 10431, 9, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (100, 28636, 10, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (101, 43055, 11, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (102, 101200, 12, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (103, 101057, 13, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (104, 3081, 14, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (105, 8909, 15, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (106, 60790, 16, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (107, 1612, 17, 6);
/* INSERT QUERY */
INSERT INTO costs(
  ID, Amount, Cost_Type_ID, Project_ID
)
VALUES
  (108, 5390, 18, 6);
