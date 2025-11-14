-- ساختار پایگاه داده سیستم مدیریت نمرات
-- توسعه‌دهنده: سعید ساعی نسب

-- جدول دانش‌آموزان
CREATE TABLE Students (
    StudentID AUTOINCREMENT PRIMARY KEY,
    FirstName TEXT(50) NOT NULL,
    LastName TEXT(50) NOT NULL, 
    Grade INTEGER NOT NULL,
    Class TEXT(10) NOT NULL,
    EnrollmentDate DATE DEFAULT DATE(),
    Phone TEXT(15),
    IsActive YESNO DEFAULT TRUE
);

-- جدول دروس
CREATE TABLE Subjects (
    SubjectID AUTOINCREMENT PRIMARY KEY,
    SubjectName TEXT(100) NOT NULL,
    TeacherName TEXT(100) NOT NULL,
    UnitCount INTEGER DEFAULT 1,
    MinScore INTEGER DEFAULT 10,
    IsActive YESNO DEFAULT TRUE
);

-- جدول نمرات ماهانه
CREATE TABLE MonthlyScores (
    ScoreID AUTOINCREMENT PRIMARY KEY,
    StudentID LONG NOT NULL,
    SubjectID LONG NOT NULL,
    Month INTEGER NOT NULL,
    Year INTEGER NOT NULL,
    Score DOUBLE NOT NULL,
    ExamType TEXT(50) DEFAULT 'عادی',
    RecordDate DATE DEFAULT DATE(),
    Description TEXT(255)
);

-- ایجاد روابط
ALTER TABLE MonthlyScores 
ADD CONSTRAINT FK_StudentScore 
FOREIGN KEY (StudentID) REFERENCES Students(StudentID);

ALTER TABLE MonthlyScores 
ADD CONSTRAINT FK_SubjectScore 
FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID);

-- ایندکس‌ها برای عملکرد بهتر
CREATE INDEX idx_student_name ON Students(LastName, FirstName);
CREATE INDEX idx_class ON Students(Grade, Class);
CREATE INDEX idx_scores ON MonthlyScores(StudentID, SubjectID, Month, Year);
