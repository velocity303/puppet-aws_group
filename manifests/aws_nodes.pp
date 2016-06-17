define aws_group::aws_nodes (
  $count              = ['01'],
  $pp_department      = 'tse',
  $pp_project         = 'ao+aws',
  $pp_created_by      = 'james.jones',
  $pp_image_name      = 'ami-775e4f16',
  $security_groups    = ['tse-crossconnect', 'tse-agents'],
  $subnet             = 'tse-subnet-avza-1',
  $key_name           = 'jamesjones-pl3',
  $pe_master_hostname = $::ec2_metadata['local-hostname'],
  $region             = 'us-west-2',
  $instance_type      = 'm4.large',
) {
  $count.each |String $node| {
    ec2_instance { "redhattest-${name}-${node}-${pp_created_by}":
      ensure            => 'running',
      image_id          => $pp_image_name,
      instance_type     => $instance_type,
      availability_zone  => $::ec2_metadata['placement']['availability-zone'],
      key_name          => $key_name,
      region            => $region,
      security_groups   => $security_groups,
      subnet            => $subnet,
      tags              => {
        'department'    => $pp_department,
        'project'       => $pp_project,
        'created_by'    => $pp_created_by,
      },
      user_data         => template('aws_group/linux.erb'),

    }
  }
}
Aws_group::Aws_nodes produces Awsgroup {}
