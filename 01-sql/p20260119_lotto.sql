--p20260119_lotto.sql

CREATE TABLE lotto_history (
    ltEpsd INT PRIMARY KEY,           -- 회차
    tm1WnNo INT,                      -- 1번 번호
    tm2WnNo INT,                      -- 2번 번호
    tm3WnNo INT,                      -- 3번 번호
    tm4WnNo INT,                      -- 4번 번호
    tm5WnNo INT,                      -- 5번 번호
    tm6WnNo INT,                      -- 6번 번호
    bnsWnNo INT,                      -- 보너스 번호
    ltRflYmd DATE,                    -- 추첨일자 (yyyy-mm-dd)
    rnk1WnNope INT,                   -- 1등 수
    rnk1WnAmt BIGINT,                 -- 1등 당첨금액
    rnk2WnNope INT,                   -- 2등 수
    rnk2WnAmt BIGINT                  -- 2등 당첨금액
);

drop table lotto_history;


CREATE TABLE lotto_draws (
    draw_round INT PRIMARY KEY,        -- 회차
    win_num_1 INT NOT NULL,
    win_num_2 INT NOT NULL,
    win_num_3 INT NOT NULL,
    win_num_4 INT NOT NULL,
    win_num_5 INT NOT NULL,
    win_num_6 INT NOT NULL,
    bonus_num INT NOT NULL,
    draw_date DATE NOT NULL,            -- 추첨일자 (YYYY-MM-DD)
    first_prize_winners INT NOT NULL,
    first_prize_amount BIGINT NOT NULL,
    second_prize_winners INT NOT NULL,
    second_prize_amount BIGINT NOT NULL
);

SELECT * FROM lotto_draws;
