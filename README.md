# Github Action running git-crypt unlock

## Usage

### Example Workflow file

```
workflow "Test git-crypt" {
  on = "push"
  resolves = ["Unlock secrets"]
}

action "Unlock secrets" {
  uses="./tools/github-actions/git-crypt-unlock"
  secrets=["GIT_CRYPT_KEY"]
}
```

### Secrets

- `GIT_CRYPT_KEY` **Required** Base64 encoded git-crypt key file.
  - Get it from an unlocked git-crypt env with:
    ```sh
    git-crypt export-key ./tmp-key && cat ./tmp-key | base64 | pbcopy && rm ./tmp-key
    ```
