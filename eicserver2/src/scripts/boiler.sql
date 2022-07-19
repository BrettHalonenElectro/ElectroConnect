CREATE TABLE IF NOT EXISTS eicprodpublic.boiler(
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id uuid NOT NULL REFERENCES eicprodpublic.user(id) ON DELETE CASCADE,
    device_model TEXT NOT NULL,
    kw_rating INT NOT NULL,
    phase_rating TEXT NOT NULL,
    power_rating INT NOT NULL,
    updated_on TIMESTAMP NOT NULL DEFAULT NOW(),
    created_on TIMESTAMP NOT NULL DEFAULT NOW()
);


CREATE TABLE IF NOT EXISTS eicprodpublic.notification(
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id uuid NOT NULL REFERENCES eicprodpublic.user(id) ON DELETE CASCADE,
    message TEXT NOT NULL,
    urgency INT DEFAULT 1,
    deleted BOOLEAN DEFAULT FALSE,
    updated_on TIMESTAMP NOT NULL DEFAULT NOW(),
    created_on TIMESTAMP NOT NULL DEFAULT NOW()
);



INSERT INTO eicprodpublic.notification(user_id, message, urgency, deleted)
VALUES(
    'c2a7e0ba-11bc-4efc-beca-0a2239c82045',
    'notification 2',
    '1',
    'false'
);

INSERT INTO eicprodpublic.boiler(user_id, device_model, kw_rating, phase_rating, power_rating, boiler_name)
VALUES(
    '110e5ce6-f08a-43ec-bd69-30ce91573d1a',
    'mini-boiler',
    '120',
    'Single Phase',
    '20',
    'house boiler'
);


CREATE TYPE eicprodpublic.jwt_token AS (
    role TEXT,
    user_id uuid,
    name TEXT
);