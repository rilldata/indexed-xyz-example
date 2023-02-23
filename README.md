# Welcome to the Rill Indexed.xyz Art Blocks example Repo

This repository is an example for the Indexed.xyz and Rill Data project for Art Blocks. You can read more at our [blog](https://docs.rilldata.com/indexed-xyz) post.

## Getting started
Make sure that you have installed Rill Developer.

```
curl -s https://cdn.rilldata.com/install.sh | bash

```
For more information, see [docs.rilldata.com](https://docs.rilldata.com).

Set the credentials you need to access the data in your CLI [as described for S3](https://docs.rilldata.com/using-rill/import-data#setting-local-credentials-for-s3). This is an experimental feature, but Cloudflare's R2 and S3 use the same API.

- *AWS Access Key ID [None]:* 43c31ff797ec2387177cabab6d18f15a
- *AWS Secret Access Key [None]:* afb354f05026f2512557922974e9dd2fdb21e5c2f5cbf929b35f0645fb284cf7
- *Default region name [None]:* <None>
- *Default output format [None]:* <None>

Run the following commands to clone the repository and start Rill:

```bash
git clone https://github.com/rilldata/indexed-xyz-example.git
cd indexed-xyz-example
rill start
```

*The initial call to `rill start` may take a while depending on your network connection as it downloads some large remote data files.*
