export_api() {
    local api_key_name="$1"
    local api_key

    case "$api_key_name" in
        openai)
            export OPENAI_API_KEY=$(pass api/openai)
            echo "Exported OPENAI_API_KEY."
            ;;
        *)
            echo "Unknown API key name: $api_key_name"
            return 1
            ;;
    esac
}
