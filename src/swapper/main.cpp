#include <web3cpp/Web3.h>
#include <web3cpp/Utils.h>

int main() 
{
    Utils::Provider provider;
    
    provider.networkName =      "Binance Smart Chain Testnet";
    provider.rpcUrl =           "testnet-dex-atlantic.binance.org";
    provider.rpcTarget =        "/api/v1";
    provider.rpcPort =          8545;
    provider.chainID =          97;
    provider.currencySymbol =   "BNB";

    Web3 w3 ( & provider );
    return 0;
}