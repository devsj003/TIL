-- 기존 테이블이 있으면 삭제 (테스트용)
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS teams;

-- 팀 테이블
CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- 직원 테이블
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    team_id INTEGER NOT NULL,
    CONSTRAINT fk_team
        FOREIGN KEY (team_id)
        REFERENCES teams(id)
        ON DELETE CASCADE
);

INSERT INTO teams (name) VALUES
('Backend'),
('Frontend'),
('Data'),
('DevOps'),
('HR');

INSERT INTO employees (name, email, team_id) VALUES
-- Backend (team_id = 1)
('김백엔드1', 'backend1@company.com', 1),
('김백엔드2', 'backend2@company.com', 1),
('김백엔드3', 'backend3@company.com', 1),
('김백엔드4', 'backend4@company.com', 1),
('김백엔드5', 'backend5@company.com', 1),

-- Frontend (team_id = 2)
('이프론트1', 'frontend1@company.com', 2),
('이프론트2', 'frontend2@company.com', 2),
('이프론트3', 'frontend3@company.com', 2),
('이프론트4', 'frontend4@company.com', 2),
('이프론트5', 'frontend5@company.com', 2),

-- Data (team_id = 3)
('박데이터1', 'data1@company.com', 3),
('박데이터2', 'data2@company.com', 3),
('박데이터3', 'data3@company.com', 3),
('박데이터4', 'data4@company.com', 3),
('박데이터5', 'data5@company.com', 3),

-- DevOps (team_id = 4)
('최데브옵스1', 'devops1@company.com', 4),
('최데브옵스2', 'devops2@company.com', 4),
('최데브옵스3', 'devops3@company.com', 4),
('최데브옵스4', 'devops4@company.com', 4),
('최데브옵스5', 'devops5@company.com', 4),

-- HR (team_id = 5)
('정인사1', 'hr1@company.com', 5),
('정인사2', 'hr2@company.com', 5),
('정인사3', 'hr3@company.com', 5),
('정인사4', 'hr4@company.com', 5),
('정인사5', 'hr5@company.com', 5);

SELECT * FROM teams;