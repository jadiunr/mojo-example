requires 'Anego', '0.02';
requires 'Aniki', '1.06';
requires 'DBD::mysql';
requires 'Mojolicious', '8.15';

on develop => sub {
    requires 'Data::Printer';
    requires 'Pry';
    requires 'Term::ReadLine::Gnu';
};