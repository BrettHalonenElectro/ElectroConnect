CREATE TABLE IF NOT EXISTS eicprodpublic.user(
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE CHECK (email ~ '^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$'),
    created_on TIMESTAMP NOT NULL DEFAULT NOW()
);



ALTER TABLE eicprodpublic.user ADD COLUMN password TEXT NOT NULL DEFAULT '';


CREATE FUNCTION eicprodpublic.SIGNUP(username TEXT, email TEXT, password TEXT) RETURNS eicprodpublic.jwt_token AS
$$
DECLARE
        token_information eicprodpublic.jwt_token;
BEGIN      
        INSERT INTO eicprodpublic.user (username, email, password) VALUES ($1, $2, crypt($3, gen_salt('bf', 8)));
        
        SELECT 'eic_user', eicprodpublic.user.id, eicprodpublic.user.username
               INTO token_information
               FROM eicprodpublic.user
               WHERE eicprodpublic.user.email = $2;
        RETURN token_information::eicprodpublic.jwt_token;
END;
$$ LANGUAGE PLPGSQL VOLATILE SECURITY DEFINER;
-- grant permissions to be able to sign up
--
GRANT EXECUTE ON FUNCTION eicprodpublic.SIGNUP(username TEXT, email TEXT, password TEXT) TO anonymous;




CREATE FUNCTION eicprodpublic.SIGNIN(email TEXT, password TEXT) RETURNS eicprodpublic.jwt_token AS
$$
DECLARE
        token_information eicprodpublic.jwt_token;
BEGIN
        SELECT 'eic_user', eicprodpublic.user.id, eicprodpublic.user.username
               INTO token_information
               FROM eicprodpublic.user
               WHERE eicprodpublic.user.email = $1
                     AND eicprodpublic.user.password = crypt($2, eicprodpublic.user.password);
       RETURN token_information::eicprodpublic.jwt_token;
end;
$$ LANGUAGE PLPGSQL VOLATILE STRICT SECURITY DEFINER;
GRANT EXECUTE ON FUNCTION eicprodpublic.SIGNIN(email TEXT, password TEXT) TO anonymous;




-- get current user id
CREATE FUNCTION eicprodpublic.current_user_id() RETURNS UUID AS $$
  SELECT NULLIF(current_setting('jwt.claims.user_id', TRUE), '')::UUID;
$$ LANGUAGE SQL STABLE;
GRANT EXECUTE ON FUNCTION eicprodpublic.current_user_id() TO anonymous;
GRANT EXECUTE ON FUNCTION eicprodpublic.current_user_id() TO eic_user;


CREATE POLICY user_notifications ON eicprodpublic.notification FOR SELECT TO eic_user
      USING (user_id=eicprodpublic.current_user_id());


      ALTER TABLE eicprodpublic.notification ENABLE ROW LEVEL SECURITY;




      {
  allNotifications {
    nodes {
      message
      deleted
      id
      urgency
      userId
      userByUserId {
        email
        username
      }
    }
  }
}
