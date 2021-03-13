### begin symbol-cli-completion.bash ###
#
# Symbol CLI v1.0.1 completion script for bash
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
                    cmds="--profile --hd --url -u --network -n --password -p --default -d --generationHash -g --namespaceId -i --divisibility -v --epochAdjustment -e --save -s"
                ;;
                info)
                    cmds="--profile --address -a"
                ;;
                *)
                    cmds="generate info"
                ;;
            esac
        ;;
        block)
            case ${words[2]} in
                info)
                    cmds="--profile --height -h"
                ;;
                receipts)
                    cmds="--profile --height -h"
                ;;
                search)
                    cmds="--profile --order -o --pageSize -n --pageNumber -n --offset -i --signerPublicKey --beneficiaryAddress --orderBy"
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
                info)
                    cmds="--profile"
                ;;
                score)
                    cmds="--profile"
                ;;
                *)
                    cmds="height info score"
                ;;
            esac
        ;;
        converter)
            case ${words[2]} in
                base32ToHexAddress)
                    cmds="--profile --address -a"
                ;;
                hexToBase32Address)
                    cmds="--profile --address -a"
                ;;
                namespaceNameToId)
                    cmds="--profile --namespaceName -n"
                ;;
                numericStringToUInt64)
                    cmds="--profile --amount -a"
                ;;
                payloadToTransaction)
                    cmds="--profile --payload -p"
                ;;
                privateKeyToPublicKey)
                    cmds="--profile --privateKey -p --network -n"
                ;;
                publicKeyToAddress)
                    cmds="--profile --publicKey -p --network -n"
                ;;
                stringToKey)
                    cmds="--profile --value -v"
                ;;
                *)
                    cmds="base32ToHexAddress hexToBase32Address namespaceNameToId numericStringToUInt64 payloadToTransaction privateKeyToPublicKey publicKeyToAddress stringToKey"
                ;;
            esac
        ;;
        metadata)
            case ${words[2]} in
                account)
                    cmds="--profile --address -a"
                ;;
                mosaic)
                    cmds="--profile --mosaicId -m"
                ;;
                namespace)
                    cmds="--profile --namespaceName -n"
                ;;
                *)
                    cmds="account mosaic namespace"
                ;;
            esac
        ;;
        monitor)
            case ${words[2]} in
                aggregatebonded)
                    cmds="--profile --address -a"
                ;;
                all)
                    cmds="--profile --address -a"
                ;;
                block)
                    cmds="--profile"
                ;;
                confirmed)
                    cmds="--profile --address -a"
                ;;
                cosignature)
                    cmds="--profile --address -a"
                ;;
                finalizedblock)
                    cmds="--profile"
                ;;
                status)
                    cmds="--profile --address -a"
                ;;
                unconfirmed)
                    cmds="--profile --address -a"
                ;;
                *)
                    cmds="aggregatebonded all block confirmed cosignature finalizedblock status unconfirmed"
                ;;
            esac
        ;;
        mosaic)
            case ${words[2]} in
                info)
                    cmds="--profile --mosaicId -m"
                ;;
                search)
                    cmds="--profile --order -o --pageSize -n --pageNumber -n --offset -i --ownerAddress"
                ;;
                *)
                    cmds="info search"
                ;;
            esac
        ;;
        namespace)
            case ${words[2]} in
                alias)
                    cmds="--profile --namespaceName -n"
                ;;
                info)
                    cmds="--profile --namespaceName -n --namespaceId -h"
                ;;
                owned)
                    cmds="--profile --address -a"
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
                    cmds="--profile --hd --url -u --network -n --password -p --default -d --generationHash -g --namespaceId -i --divisibility -v --epochAdjustment -e"
                ;;
                decrypt)
                    cmds="--profile"
                ;;
                import)
                    cmds="--profile --hd --url -u --network -n --password -p --default -d --generationHash -g --namespaceId -i --divisibility -v --epochAdjustment -e --privateKey -P --mnemonic -M --pathNumber -N --optin -O"
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
                    cmds="--profile --address -a"
                ;;
                mosaicaddress)
                    cmds="--profile --address -a --mosaicId -m"
                ;;
                mosaicglobal)
                    cmds="--profile --mosaicId -m"
                ;;
                *)
                    cmds="account mosaicaddress mosaicglobal"
                ;;
            esac
        ;;
        transaction)
            case ${words[2]} in
                accountaddressrestriction)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --flags -f --action -a --recipientAddress -v"
                ;;
                accountkeylink)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --linkedPublicKey -u --action -a"
                ;;
                accountmetadata)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --targetAddress -t --key -k --value -v"
                ;;
                accountmosaicrestriction)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --flags -f --action -a --mosaicId -v"
                ;;
                accountoperationrestriction)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --flags -f --action -a --transactionType -v"
                ;;
                addressalias)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --action -a --address -a --namespaceName -n"
                ;;
                cosign)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --transactionInputType -i --hash -h --payload -p"
                ;;
                info)
                    cmds="--profile --hash -h"
                ;;
                mosaic)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --amount -a --transferable -t --supplyMutable -s --restrictable -r --divisibility -d --duration -u --nonExpiring -n"
                ;;
                mosaicaddressrestriction)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --mosaicId -m --targetAddress -a --restrictionKey -k --newRestrictionValue -V"
                ;;
                mosaicalias)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --action -a --mosaicId -m --namespaceName -n"
                ;;
                mosaicglobalrestriction)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --mosaicId -m --referenceMosaicId -r --restrictionKey -k --newRestrictionValue -V --newRestrictionType -T"
                ;;
                mosaicmetadata)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --mosaicId -m --targetAddress -t --key -k --value -v"
                ;;
                mosaicsupplychange)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --action -a --mosaicId -m --amount -d"
                ;;
                multisigmodification)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --minRemovalDelta -R --minApprovalDelta -A --action -a --cosignatoryAddresses -p --multisigAccountPublicKey -u --aggregateType -t --deadline -d"
                ;;
                namespace)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --name -n --rootnamespace -r --subnamespace -s --duration -d --parentName -a"
                ;;
                namespacemetadata)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --namespaceId -n --targetAddress -t --key -k --value -v"
                ;;
                nodekeylink)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --linkedPublicKey -u --action -a"
                ;;
                payload)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --payload -P --cosignatures -c"
                ;;
                persistentharvestdelegation)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --remotePrivateKey -r --recipientPublicKey -u --vrfPrivateKey -v"
                ;;
                search)
                    cmds="--profile --order -o --pageSize -n --pageNumber -n --offset -i --group --address --recipientAddress --signerPublicKey --height --type --fromHeight --toHeight"
                ;;
                secretlock)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --mosaicId -m --amount -a --duration -d --secret -s --hashAlgorithm -H --recipientAddress -r"
                ;;
                secretproof)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --secret -s --proof -p --hashAlgorithm -H --recipientAddress -r"
                ;;
                status)
                    cmds="--profile --hash -h"
                ;;
                transfer)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --recipientAddress -r --message -m --encrypted -e --mosaics -c --recipientPublicKey -u"
                ;;
                uri)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --uri -u"
                ;;
                votingkeylink)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --linkedPublicKey -u --startPoint --endPoint --action -a"
                ;;
                vrfkeylink)
                    cmds="--profile --password -p --maxFee -f --sync --announce --mode -M --signer -S --maxFeeHashLock -F --lockDuration -D --lockAmount -L --linkedPublicKey -u --action -a"
                ;;
                *)
                    cmds="accountaddressrestriction accountkeylink accountmetadata accountmosaicrestriction accountoperationrestriction addressalias cosign info mosaic mosaicaddressrestriction mosaicalias mosaicglobalrestriction mosaicmetadata mosaicsupplychange multisigmodification namespace namespacemetadata nodekeylink payload persistentharvestdelegation search secretlock secretproof status transfer uri votingkeylink vrfkeylink"
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
