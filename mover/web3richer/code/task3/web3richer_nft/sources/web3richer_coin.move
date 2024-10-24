module web3richer_nft::web3richer_coin {

    use sui::coin;
    use sui::transfer;

    public struct WEB3RICHER_COIN has drop{}

    fun init(witness: WEB3RICHER_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) =
            coin::create_currency(
            witness,
            8,
            b"WRC",
            b"Web3Richer Coin",
            b"the coin for web3richer",
            option::none(),
            ctx
        );

        transfer::public_freeze_object(metadata);

        transfer::public_transfer(treasury, ctx.sender());
    }

}