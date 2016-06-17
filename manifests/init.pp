application aws_group (
  $username = 'james.jones',
  $count = ['01'],
) {
  aws_group::aws_nodes { $name:
    pp_created_by => $username,
    count         => $count,
    export        => Awsgroup[$name],
  }
}
