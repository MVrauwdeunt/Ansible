# just vault (encrypt/decrypt/edit) file
@vault ACTION FILE:
    ansible-vault {{ ACTION }} {{invocation_directory()}}/{{ FILE }} --vault-password-file /home/zanbee/.vault.key

@push MSG:
    git add .
    git commit -m "{{ MSG }}"
    git push



