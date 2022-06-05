# DBank

It is a decentralized web app example.

## Running the project locally

```bash
# Starts the dfx replica
dfx start

# Deploys canisters to the replica
dfx deploy
```

Once the job completes, application will be available at `http://localhost:8000?canisterId={asset_canister_id}`.

To test ICP functions by UI go to `http://localhost:8000?canisterId={candid_id}`. It will ask for canister id to login. Enter canister_id in that.

```bash
# To get the asset_canister_id
dfx canister id dbank_assets

# To get candid_id
dfx canister id __Candid_UI

# To get canister_id
dfx canister id dbank
```

To run frontend server

```bash
npm start
```

Which will start a server at `http://localhost:8080`, proxying API requests to the replica at port 8000.
