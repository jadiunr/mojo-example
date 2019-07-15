package MojoExample::DB::Schema;
use strict;
use warnings;
use DBIx::Schema::DSL;

database 'MySQL';
create_database 'app_development';

create_table 'tasks' => columns {
    integer 'id', primary_key, auto_increment;
    varchar 'name';
};