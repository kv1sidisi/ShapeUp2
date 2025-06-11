create table workout (
    workout_id uuid primary key default gen_random_uuid(),
    user_id uuid not null,
    name varchar not null,
    duration interval not null,
    start_date date not null,

    constraint fk_workout_user
        foreign key (user_id)
        references users (user_id)
        on delete cascade
);

create table exercise_library (
    exercise_library_id uuid primary key default gen_random_uuid(),
    user_id uuid unique not null,

    constraint fk_exercise_library_uder
        foreign key (user_id)
        references users (user_id)
        on delete cascade
);

create table exercise_template (
    exercise_template_id uuid primary key default gen_random_uuid(),
    exercise_library_id uuid not null,
    name varchar not null,
    technique_description varchar,

    constraint fk_exercise_template_exercise_library
        foreign key (exercise_library_id)
        references exercise_library (exercise_library_id)
        on delete cascade
);

create table workout_exercise (
    workout_exercise_id uuid primary key default gen_random_uuid(),
    workout_id uuid not null,
    exercise_template_id uuid not null,

    constraint fk_workout_exercise_workout
        foreign key (workout_id)
        references workout (workout_id)
        on delete cascade,

    constraint fk_workout_exercise_exercise_template
        foreign key (exercise_template_id)
        references exercise_template (exercise_template_id)
        on delete restrict,

    constraint uq_workout_exercise unique (workout_id, exercise_template_id)
);

create table set (
    set_id uuid primary key default gen_random_uuid(),
    workout_exercise_id uuid not null,
    set_number smallint not null,
    rpe decimal(2,1),
    notes varchar,
    reps smallint,
    value_numeric decimal(2,1),
    value_time interval,

    constraint fk_set_workout_exercise
        foreign key (workout_exercise_id)
        references workout_exercise (workout_exercise_id)
        on delete cascade
);

create table muscle_group (
    muscle_group_id uuid primary key default gen_random_uuid(),
    exercise_template_id uuid not null,
    name varchar unique not null,

    constraint fk_muscle_group_exercise_template
        foreign key (exercise_template_id)
        references exercise_template (exercise_template_id)
        on delete cascade
);




