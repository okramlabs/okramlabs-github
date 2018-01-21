# Project deploy keys

## Generate the SSH keys
```
ssh-keygen -t rsa -b 4096 -C "<howi@okramlabs.com>" -f ./tmp/howibot -N ''
```


## Add new deploy keys to GitHub

### Option 1 add as howibot SSH key

Add `./tmp/howibot.pub` for user https://github.com/howibot
log in as @howibot and navigate to https://github.com/settings/keys

### Option 2 add as deploy key

Add `./tmp/howibot.pub` as deploy key for both repositories with  
*note one deploy key can be only used for one repo*

- [x] Allow write access

**Staging**
> https://okramlabs.github.io/okramlabs.github.src/

- https://github.com/okramlabs/okramlabs.github.src/settings/keys

**Production**
> https://okramlabs.github.io/

- https://github.com/okramlabs/okramlabs.github.io/settings/keys


## Configure everything
> upload / update public keys everywhere needed

### Configure Travis CI

**install travis cli**

```
gem install travis
```

**configure repo**

```
cd okramlabs/okramlabs.github.src
travis login
travis encrypt-file ./tmp/howibot
```

```
mv howibot.enc ./howi-bash-bot/res/travis-ci/howibot_deploy_key.enc
```

## remove private and public kes locally

`rm -rf ./tmp/howibot*`
