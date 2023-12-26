
region = "eu-central-1" 
/*
-------------------------------------------
|               GetRegions                |
+------+---------------+------------------+
| Code |  displayName  |      name        |
+------+---------------+------------------+
|  NA  |  Virginia     |  us-east-1       |
|  NA  |  Ohio         |  us-east-2       |
|  NA  |  Oregon       |  us-west-2       |
|  EU  |  Ireland      |  eu-west-1       |
|  EU  |  London       |  eu-west-2       |
|  EU  |  Paris        |  eu-west-3       |
|  EU  |  Frankfurt    |  eu-central-1    |
|  AP  |  Singapore    |  ap-southeast-1  |
|  AP  |  Sydney       |  ap-southeast-2  |
|  AP  |  Tokyo        |  ap-northeast-1  |
|  AP  |  Seoul        |  ap-northeast-2  |
|  AP  |  Mumbai       |  ap-south-1      |
|  NA  |  Montreal     |  ca-central-1    |
|  EU  |  Stockholm    |  eu-north-1      |
+------+---------------+------------------+
*/

access_key = "${ACCESS_KEY}"
secret_key = "${SECRET_KEY}"


instance_name     = "Antinone" #Instance Name 
availability_zone = "a"               #Region Zone   
os                = "ubuntu_20_04"    # OS
instance_type     = "nano_3_0"        # Type

/*
------------------------------------------------------------------------------------
|                                    GetBundles                                    |
+-----+-------+-------+------------+------------------+----------------+-----------+
| CPU | DISK  |  RAM  | bandwidth  |    bundleId      | instanceType   |   name    |
+-----+-------+-------+------------+------------------+----------------+-----------+
|  2  |  20   |  0.5  |  1024      |  nano_3_0        |  nano          |  Nano     |
|  2  |  40   |  1.0  |  2048      |  micro_3_0       |  micro         |  Micro    |
|  2  |  60   |  2.0  |  3072      |  small_3_0       |  small         |  Small    |
|  2  |  80   |  4.0  |  4096      |  medium_3_0      |  medium        |  Medium   |
|  2  |  160  |  8.0  |  5120      |  large_3_0       |  large         |  Large    |
|  4  |  320  |  16.0 |  6144      |  xlarge_3_0      |  xlarge        |  Xlarge   |
|  8  |  640  |  32.0 |  7168      |  2xlarge_3_0     |  2xlarge       |  2Xlarge  |
|  2  |  30   |  0.5  |  1024      |  nano_win_3_0    |  nano          |  Nano     |
|  2  |  40   |  1.0  |  2048      |  micro_win_3_0   |  micro         |  Micro    |
|  2  |  60   |  2.0  |  3072      |  small_win_3_0   |  small         |  Small    |
|  2  |  80   |  4.0  |  4096      |  medium_win_3_0  |  medium        |  Medium   |
|  2  |  160  |  8.0  |  5120      |  large_win_3_0   |  large         |  Large    |
|  4  |  320  |  16.0 |  6144      |  xlarge_win_3_0  |  xlarge        |  Xlarge   |
|  8  |  640  |  32.0 |  7168      |  2xlarge_win_3_0 |  2xlarge       |  2Xlarge  |
+-----+-------+-------+------------+------------------+----------------+-----------+
BUNDLES nano_3_0        2       20      nano    True    Nano    298     3.5     0.5     1024
BUNDLES micro_3_0       2       40      micro   True    Micro   500     5.0     1.0     2048
BUNDLES small_3_0       2       60      small   True    Small   1000    10.0    2.0     3072
BUNDLES medium_3_0      2       80      medium  True    Medium  2000    20.0    4.0     4096
BUNDLES large_3_0       2       160     large   True    Large   3000    40.0    8.0     5120
BUNDLES xlarge_3_0      4       320     xlarge  True    Xlarge  4000    80.0    16.0    6144
BUNDLES 2xlarge_3_0     8       640     2xlarge True    2Xlarge 5000    160.0   32.0    7168
*/

ssh_key_path    = "~/.ssh/id_aws"       # Private key for exec to instance
public_key_path = "~/.ssh/id_aws.pub"   # Public Key for ssh login
ssh_user        = "ubuntu"              # User ssh login

domain = "example.com"          # Tag set for instance 
