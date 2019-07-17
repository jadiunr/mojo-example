requires 'Anego', '0.02';
requires 'Aniki', '1.06';
requires 'DBD::Pg';
requires 'Mojolicious', '8.15';
requires 'Mojo::JWT';

on develop => sub {
    requires 'Data::Printer';
    requires 'Pry';
    requires 'Term::ReadLine::Gnu';
};