package MojoExample::DB::Schema;
use Mojo::Base -strict;
use DBIx::Schema::DSL;

database 'PostgreSQL';

create_table 'tasks' => columns {
    integer 'id', primary_key, auto_increment;
    varchar 'name', not_null;
    timestamp 'created_at', not_null;
    timestamp 'updated_at', not_null;
};