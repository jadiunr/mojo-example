package MojoExample::Web::Controller::Tasks;
use Mojo::Base 'Mojolicious::Controller';

sub index {
    my $self = shift;

    my $tasks = $self->db->select('tasks');
    $self->render(json => $tasks->row_datas);
}

sub create {
    my $self = shift;

    my $name = $self->param('name');
    my $task = $self->db->insert_and_fetch_row(tasks => {name => $name});

    $self->render(json => $task->row_data);
}

1;
