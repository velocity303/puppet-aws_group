Sample useage

```puppet

site {
  $nodes = ['01','02','03']
  aws_group { 'initial':
    count                                                       => $nodes,
    nodes                                                       => {
      Node['ec2-52-41-129-201.us-west-2.compute.amazonaws.com'] => Aws_group::Aws_nodes['initial'],
    }
  }
}

```
