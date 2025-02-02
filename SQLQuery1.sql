﻿-- Query the PoKi database using SQL SELECT statements to answer the following questions.

-- 1. What grades are stored in the database?
/*
SELECT Name 
FROM Grade
*/


-- 2. What emotions may be associated with a poem?
/*
SELECT Name
FROM Emotion
*/


-- 3. How many poems are in the database?
-- SELECT COUNT(Id) FROM Poem


-- 4. Sort authors alphabetically by name. What are the names of the top 76 authors?
/*
SELECT TOP 76 Name 
FROM Author
ORDER BY Name ASC
*/


-- 5. Starting with the above query, add the grade of each of the authors.
/*
SELECT TOP 76 a.Name, g.Name
FROM Grade g
LEFT JOIN Author a ON  a.GradeId = g.Id
ORDER BY a.Name ASC
*/


-- 6. Starting with the above query, add the recorded gender of each of the authors.
/*
SELECT TOP 76 a.Name, g.Name, gen.Name
FROM Grade g
LEFT JOIN Author a ON  a.GradeId = g.Id
LEFT JOIN Gender gen ON a.GenderId = gen.Id
ORDER BY a.Name ASC
*/

-- 7. What is the total number of words in all poems in the database?
/*
SELECT COUNT(WordCount)
FROM Poem
*/


-- 8. Which poem has the fewest characters?
/*
SELECT Title, CharCount
FROM Poem
WHERE CharCount = (SELECT MIN(CharCount) FROM Poem)
*/


-- 9. How many authors are in the third grade?
/*
SELECT COUNT(Name)
From Author
WHERE GradeId = 3
*/


-- 10. How many authors are in the first, second or third grades?
/*
SELECT COUNT(Name)
From Author
WHERE GradeId = 3 OR GradeId = 2 OR GradeId = 1
*/


-- 11. What is the total number of poems written by fourth graders?
/*
SELECT COUNT(Title)
FROM Poem
LEFT JOIN Author a ON AuthorId = a.Id
WHERE GradeId = 4
*/


-- 12. How many poems are there per grade?
/*
SELECT g.Name, COUNT(g.Name) as PoemsPerGrade
FROM Grade g, Poem p, Author a
WHERE a.GradeId = g.Id AND p.AuthorId = a.GradeId
GROUP BY(g.Name)
*/


-- 13. How many authors are in each grade? (Order your results by grade starting with 1st Grade)
/*
SELECT g.Name, COUNT(g.Name)
FROM Grade g
LEFT JOIN Author a ON a.GradeId = g.Id
GROUP BY(g.Name)
*/


-- 14. What is the title of the poem that has the most words?
/*
SELECT Title 
FROM Poem
WHERE WordCount = (SELECT MAX(WordCount) FROM Poem)
*/


-- 15. Which author(s) have the most poems? (Remember authors can have the same name.)
SELECT Name, COUNT(Title)
FROM Author, Poem
GROUP BY Name
ORDER BY COUNT(Title) DESC

-- 16. How many poems have an emotion of sadness?
-- 17. How many poems are not associated with any emotion?
-- 18. Which emotion is associated with the least number of poems?
-- 19. Which grade has the largest number of poems with an emotion of joy?
-- 20. Which gender has the least number of poems with an emotion of fear?