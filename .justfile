# just vault (encrypt/decrypt/edit) file
@vault ACTION FILE:
    ansible-vault {{ ACTION }} {{invocation_directory()}}/{{ FILE }} --vault-password-file /home/zanbee/.vault.key

@commit MSG:
    git commit -am "{{ MSG }}"


