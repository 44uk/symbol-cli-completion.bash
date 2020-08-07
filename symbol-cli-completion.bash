### begin symbol-cli-completion.bash ###
#
# symbol-cli completion script for bash
#
# Installation: cat symbol-cli-completion.bash >> ~/.bashrc
# Or, maybe: mv symbol-cli-completion.bash /etc/bash_completion.d/symbol-cli
#
__symbol-cli-completion() {
    local cmds cur prev words cword split
    _init_completion || return

    if [ -x "$(command -v jq)" ] && [ "$prev" = "--profile" ]; then
        cmds=$(cat ~/.symbolrc.json | jq -r 'keys | join(" ")')
        COMPREPLY=( $(compgen -W "$cmds" -- "$cur") )
        return
    fi

    case ${words[1]} in
        account)
            case ${words[2]} in
                generate)
                    cmds="--profile --hd -u --url -n --network -p --password -d --default -g --generation-hash -i --namespace-id -v --divisibility -s --save"
                ;;
                info)
                    cmds="--profile -a --address"
                ;;
                *)
                    cmds="generate info"
                ;;
            esac
        ;;
        block)
            case ${words[2]} in
                info)
                    cmds="--profile -h --height"
                ;;
                receipts)
                    cmds="--profile -h --height"
                ;;
                search)
                    cmds="--profile -o --order -n --page-size -n --page-number -i --offset --signer-public-key --beneficiary-address --order-by"
                ;;
                *)
                    cmds="info receipts search"
                ;;
            esac
        ;;
        chain)
            case ${words[2]} in
                height)
                    cmds="--profile"
                ;;
                score)
                    cmds="--profile"
                ;;
                *)
                    cmds="height score"
                ;;
            esac
        ;;
        converter)
            case ${words[2]} in
                base32ToHexAddress)
                    cmds="--profile -a --address"
                ;;
                hexToBase32Address)
                    cmds="--profile -a --address"
                ;;
                namespaceNameToId)
                    cmds="--profile -n --namespace-name"
                ;;
                numericStringToUInt64)
                    cmds="--profile -a --amount"
                ;;
                payloadToTransaction)
                    cmds="--profile -p --payload"
                ;;
                privateKeyToPublicKey)
                    cmds="--profile -p --private-key -n --network"
                ;;
                publicKeyToAddress)
                    cmds="--profile -p --public-key -n --network"
                ;;
                stringToKey)
                    cmds="--profile -v --value"
                ;;
                *)
                    cmds="base32ToHexAddress hexToBase32Address namespaceNameToId numericStringToUInt64 payloadToTransaction privateKeyToPublicKey publicKeyToAddress stringToKey"
                ;;
            esac
        ;;
        metadata)
            case ${words[2]} in
                account)
                    cmds="--profile -a --address"
                ;;
                mosaic)
                    cmds="--profile -m --mosaic-id"
                ;;
                namespace)
                    cmds="--profile -n --namespace-name"
                ;;
                *)
                    cmds="account mosaic namespace"
                ;;
            esac
        ;;
        monitor)
            case ${words[2]} in
                aggregatebonded)
                    cmds="--profile -a --address"
                ;;
                all)
                    cmds="--profile"
                ;;
                block)
                    cmds="--profile"
                ;;
                confirmed)
                    cmds="--profile"
                ;;
                cosignature)
                    cmds="--profile"
                ;;
                status)
                    cmds="--profile"
                ;;
                unconfirmed)
                    cmds="--profile"
                ;;
                *)
                    cmds="aggregatebonded all block confirmed cosignature status unconfirmed"
                ;;
            esac
        ;;
        mosaic)
            case ${words[2]} in
                info)
                    cmds="--profile -m --mosaic-id"
                ;;
                search)
                    cmds="--profile --owner-address"
                ;;
                *)
                    cmds="info search"
                ;;
            esac
        ;;
        namespace)
            case ${words[2]} in
                alias)
                    cmds="--profile -n --namespace-name"
                ;;
                info)
                    cmds="--profile -n --namespace-name -h --namespace-id"
                ;;
                owned)
                    cmds="--profile -a --address"
                ;;
                *)
                    cmds="alias info owned"
                ;;
            esac
        ;;
        node)
            case ${words[2]} in
                health)
                    cmds="--profile"
                ;;
                info)
                    cmds="--profile"
                ;;
                serverinfo)
                    cmds="--profile"
                ;;
                storageinfo)
                    cmds="--profile"
                ;;
                *)
                    cmds="health info serverinfo storageinfo"
                ;;
            esac
        ;;
        profile)
            case ${words[2]} in
                create)
                    cmds="--profile"
                ;;
                decrypt)
                    cmds="--profile"
                ;;
                import)
                    cmds="--profile -P --private-key -M --mnemonic -N --path-number"
                ;;
                list)
                    cmds="--profile"
                ;;
                setdefault)
                    cmds="--profile"
                ;;
                *)
                    cmds="create decrypt import list setdefault"
                ;;
            esac
        ;;
        restriction)
            case ${words[2]} in
                account)
                    cmds="--profile -a --address"
                ;;
                mosaicaddress)
                    cmds="--profile -a --address -m --mosaic-id"
                ;;
                mosaicglobal)
                    cmds="--profile -m --mosaic-id"
                ;;
                *)
                    cmds="account mosaicaddress mosaicglobal"
                ;;
            esac
        ;;
        transaction)
            case ${words[2]} in
                accountaddressrestriction)
                    cmds="--profile -p --password -f --max-fee --sync --announce -M --mode -S --signer -F --max-fee-hash-lock -D --lock-duration -L --lock-amount -f --flags -a --action -v --recipient-address"
                ;;
                accountkeylink)
                    cmds="--profile -u --linked-public-key -a --action"
                ;;
                accountmetadata)
                    cmds="--profile -t --target-address -k --key -v --value"
                ;;
                accountmosaicrestriction)
                    cmds="--profile -f --flags -a --action -v --mosaic-id"
                ;;
                accountoperationrestriction)
                    cmds="--profile -f --flags -a --action -v --transaction-type"
                ;;
                addressalias)
                    cmds="--profile -a --action -a --address -n --namespace-name"
                ;;
                cosign)
                    cmds="--profile -h --hash"
                ;;
                info)
                    cmds="--profile -h --hash"
                ;;
                mosaic)
                    cmds="--profile -a --amount -t --transferable -s --supply-mutable -r --restrictable -d --divisibility -u --duration -n --non-expiring"
                ;;
                mosaicaddressrestriction)
                    cmds="--profile -m --mosaic-id -a --target-address -k --restriction-key -V --new-restriction-value"
                ;;
                mosaicalias)
                    cmds="--profile -a --action -m --mosaic-id -n --namespace-name"
                ;;
                mosaicglobalrestriction)
                    cmds="--profile -m --mosaic-id -r --reference-mosaic-id -k --restriction-key -V --new-restriction-value -T --new-restriction-type"
                ;;
                mosaicmetadata)
                    cmds="--profile -m --mosaic-id -t --target-address -k --key -v --value"
                ;;
                mosaicsupplychange)
                    cmds="--profile -a --action -m --mosaic-id -d --amount"
                ;;
                multisigmodification)
                    cmds="--profile -R --min-removal-delta -A --min-approval-delta -a --action -p --cosignatory-addresses -u --multisig-account-public-key"
                ;;
                namespace)
                    cmds="--profile -n --name -r --rootnamespace -s --subnamespace -d --duration -a --parent-name"
                ;;
                namespacemetadata)
                    cmds="--profile -n --namespace-id -t --target-address -k --key -v --value"
                ;;
                nodekeylink)
                    cmds="--profile -u --linked-public-key -a --action"
                ;;
                persistentharvestdelegation)
                    cmds="--profile -r --remote-private-key -u --recipient-public-key"
                ;;
                search)
                    cmds="--profile --group --address --recipient-address --signer-public-key --height --type"
                ;;
                secretlock)
                    cmds="--profile -m --mosaic-id -a --amount -d --duration -s --secret -H --hash-algorithm -r --recipient-address"
                ;;
                secretproof)
                    cmds="--profile -s --secret -p --proof -H --hash-algorithm -r --recipient-address"
                ;;
                status)
                    cmds="--profile -h --hash"
                ;;
                transfer)
                    cmds="--profile -r --recipient-address -m --message -e --encrypted -c --mosaics -u --recipient-public-key"
                ;;
                uri)
                    cmds="--profile -u --uri"
                ;;
                votingkeylink)
                    cmds="--profile -u --linked-public-key --start-point --end-point -a --action"
                ;;
                vrfkeylink)
                    cmds="--profile -u --linked-public-key -a --action"
                ;;
                *)
                    cmds="accountaddressrestriction accountkeylink accountmetadata accountmosaicrestriction accountoperationrestriction addressalias cosign info mosaic mosaicaddressrestriction mosaicalias mosaicglobalrestriction mosaicmetadata mosaicsupplychange multisigmodification namespace namespacemetadata nodekeylink persistentharvestdelegation search secretlock secretproof status transfer uri votingkeylink vrfkeylink"
                ;;
            esac
        ;;
        *)
            cmds="account block chain converter metadata monitor mosaic namespace node profile restriction transaction"
        ;;
    esac
    COMPREPLY=( $(compgen -W "$cmds" -- "$cur") )
}

complete -o default -F __symbol-cli-completion symbol-cli
### end symbol-cli-completion.bash ###
