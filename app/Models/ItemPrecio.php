<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ItemPrecio
 * 
 * @property int $idPrecio
 * @property int $idItem
 * @property float $precio
 * @property int|null $idMoneda
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Item $item
 * @property Moneda $moneda
 *
 * @package App\Models
 */
class ItemPrecio extends Model
{
	protected $table = 'item_precio';
	protected $primaryKey = 'idPrecio';
	public $timestamps = false;

	protected $casts = [
		'idItem' => 'int',
		'precio' => 'float',
		'idMoneda' => 'int',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'idItem',
		'precio',
		'idMoneda',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function item()
	{
		return $this->belongsTo(Item::class, 'idItem');
	}

	public function moneda()
	{
		return $this->belongsTo(Moneda::class, 'idMoneda');
	}
}
