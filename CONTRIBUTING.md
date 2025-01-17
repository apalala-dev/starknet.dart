# Contributor Guide

**starknet.dart** is a dart package allowing any dart program (mainly Flutter apps) to communicate with the [StarkNet](https://starknet.io/docs/) blockchain.

The [StarkNet nodes](https://github.com/eqlabs/pathfinder/blob/06ea631557937d4319aa539a2021e312ec757ac2/crates/pathfinder/src/rpc.rs) expose a JSON-RPC API (see the [specs](https://github.com/starkware-libs/starknet-specs)) that we can call to call Smart Contract methods or even get information on blocks and past transactions.

The goal of the project is thus to build a bridge between dart applications and Starknet, while staying consistent with the common abstractions used in other blockchain SDKs (see [ethers.js](https://docs.ethers.io/v5/)).

## Why contributing to starknet.dart?

StarkNet is a revolution in the web3 world: it allows to [scale Ethereum](https://docs.ethhub.io/ethereum-roadmap/layer-2-scaling/zk-rollups/) and offers the best UX one can dream of on a blockchain thanks to unique features like [account abstraction](https://www.argent.xyz/blog/wtf-is-account-abstraction/) or [session keys](https://github.com/dontpanicdao/starknet-burner).

But web3 mainstream adoption won't happen unless decentralized applications go to mobile. That's why it's a priority to build the best possible Starknet SDK for Flutter, one of the most used cross-platform mobile framework.

If you want to contribute to the web3 adoption and more specifically StarkNet one, then you probably **can't have more impact than working on this SDK** that will be used by the majority of Flutter dApps on StarkNet!

## How to contribute

### You have a feature suggestion or want to report a bug

Then you should first [check out if this issue does not exist already](https://github.com/gabsn/starknet.dart/issues). If it does, you can upvote the existing one. If it's a new issue, please go on the project [telegram chat](https://t.me/+CWezjfLIRYc0MDY0) and explain what's your problem and why it should be top priority. We'll then add your issue to the roadmap.

### You want to implement a feature / fix a bug / update the doc

1. ⚠️ Very important: if you want to get involved, please go to the [telegram chat](https://t.me/+CWezjfLIRYc0MDY0) and explain which issue you want to tackle. We'll try to do our best to support you and help you.
2. Fork the repository and create a branch prefixed by the issue number.
3. Implement your feature / bug fix and push it to your remote fork. We strongly recommend you to write the test first, then implement the feature (see [TDD](https://en.wikipedia.org/wiki/Test-driven_development)).
4. Go on github and create a Pull Request from your forked repo to the original one.
5. Ping us on telegram with your PR link so we can review it and merge it.

### You want to become a core contributor

After a few qualitative contributions, we'll probably offer you to join the core team to become a maintainer of the project and get paid for your work.
