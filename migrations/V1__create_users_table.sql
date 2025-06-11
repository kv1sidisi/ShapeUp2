CREATE TABLE users (
    user_id uuid primary key default gen_random_uuid(),
    login varchar not null,
    birth_date date,
    photo varchar
);

CREATE TABLE user_credentials (
    user_credentials_id uuid primary key default gen_random_uuid(),
    user_id uuid unique not null,
    email varchar unique not null,
    email_verified boolean default false,
    password_hash varchar not null,

    constraint fk_user_credentials_user
        foreign key (user_id)
        references users (user_id)
        on delete cascade
);