# Fetch Cursor model pricing (lowest & highest)

Invoke the **`cursor-model-pricing`** subagent to fetch current rates, then answer with **only** the cheapest and most expensive metered models. Do **not** paste the subagent’s full JSON to the user.

## Procedure

1. Launch the **`cursor-model-pricing`** subagent in the **foreground** (not `generalPurpose` or `explore`).
   - Agent definition: `.cursor/agents/cursor-model-pricing.md` or `~/.cursor/agents/cursor-model-pricing.md`
2. Give the subagent this task verbatim: *Execute your documented workflow: fetch the official Cursor models-and-pricing documentation, parse all pricing tables, and produce one JSON document that validates against the CursorPricingTable schema in your agent file.*
3. Wait until the subagent finishes.
4. Parse the JSON from the subagent result (extract the object even if wrapped in markdown fences or notes).
5. From `metered_models`, determine:
   - **Lowest-price model:** minimum `cost_per_1m_output_tokens`; ties broken by lower `cost_per_1m_input_tokens`, then lexicographic `model_id`.
   - **Highest-price model:** maximum `cost_per_1m_output_tokens`; ties broken by higher `cost_per_1m_input_tokens`, then lexicographic `model_id`.
6. Ignore `tiers` for the user-facing answer unless the user’s message after the command explicitly asks for plan pricing.

## Response (strict)

Reply in **short prose** (a few sentences or a tiny bullet list). Include for each of the two models:

- `model_id`, `provider`
- Input, cache-read (if present), and output cost per 1M tokens (USD)
- `metadata.last_updated` and `metadata.source_url` once (from the parsed JSON)

Do **not** include:

- The full pricing JSON or `metered_models` array
- Markdown code fences around large JSON blobs
- Subagent notes or mapping commentary unless the user asked for it

On failure (subagent error, unparseable JSON, empty `metered_models`), reply with one short sentence stating the error. Do not return raw `{"error":...}` JSON unless the user explicitly asked for JSON.

Additional text after the command line (e.g. `/fetch-cursor-model-price native-only`) is optional filter context: apply it when picking lowest/highest (e.g. only `is_native_pool: true`) and mention the filter in the reply.