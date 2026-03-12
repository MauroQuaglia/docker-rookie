# Esempi vari
* `curl -s http://localhost:12434/engines/v1/models | jq`
* 
```
  curl -s http://localhost:12434/engines/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{
  "model": "ai/gemma3:4B-Q4_K_M",
  "messages": [
  {"role": "system", "content": "Keep your response to one sentence only."},
  {"role": "user", "content": "How long is a day on Mars?"}
  ]
  }' | jq
```