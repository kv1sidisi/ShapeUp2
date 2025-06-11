CREATE TABLE stats (
    stats_id uuid primary key default gen_random_uuid(),
    user_id uuid unique not null,

    constraint fk_stats_users
        foreign key (user_id)
        references users (user_id)
        on delete cascade
);

CREATE TABLE stat (
    stat_id uuid primary key default gen_random_uuid(),
    stats_id uuid not null,
    name varchar not null,
    value varchar not null,
    last_update date not null,

    constraint fk_stat_stats
        foreign key (stats_id)
        references stats (stats_id)
        on delete cascade
);