export_api() {
    local api_key_name="$1"
    local api_key

    case "$api_key_name" in
        openai)
            api_key=$(pass openai/api_key)
            ;;
        other_api)
            api_key=$(pass other_api/api_key)
            ;;
        # Add more cases as needed for different API keys
        *)
            echo "Unknown API key name: $api_key_name"
            return 1
            ;;
    esac

    if [ -n "$api_key" ]; then
        export "${api_key_name^^}_API_KEY=$api_key"
        echo "$api_key_name API key has been exported."
    else
        echo "Unable to retrieve $api_key_name API key from pass."
    fi
}
