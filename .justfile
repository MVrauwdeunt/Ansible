# just vault (encrypt/decrypt/edit) file
@vault ACTION FILE:
    ansible-vault {{ ACTION }} {{ FILE }} --vault-password-file /home/zanbee/.vault.key
