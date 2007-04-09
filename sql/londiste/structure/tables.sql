set default_with_oids = 'off';

create schema londiste;
grant usage on schema londiste to public;

create table londiste.provider_table (
    nr                  serial not null,
    queue_name          text not null,
    table_name          text not null,
    trigger_name        text,
    primary key (queue_name, table_name)
);

create table londiste.provider_seq (
    nr                  serial not null,
    queue_name          text not null,
    seq_name            text not null,
    primary key (queue_name, seq_name)
);

create table londiste.completed (
    consumer_id     text not null,
    last_tick_id    bigint not null,

    primary key (consumer_id)
);

create table londiste.link (
    source text not null,
    dest text not null,
    primary key (source),
    unique (dest)
);

create table londiste.subscriber_table (
    nr                  serial not null,
    queue_name          text not null,
    table_name          text not null,
    snapshot            text,
    merge_state         text,
    trigger_name        text,

    skip_truncate       bool,

    primary key (queue_name, table_name)
);

create table londiste.subscriber_seq (
    nr                  serial not null,
    queue_name          text not null,
    seq_name          text not null,

    primary key (queue_name, seq_name)
);

