<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Inventario
 * 
 * @property int $idInventario
 * @property int $idUsuario
 * @property int $idMoneda
 * @property int $idTipoTransaccion
 * @property int $idUbicacion
 * @property int $idUbicacion2
 * @property float $documentoRelacionado
 * @property int|null $autorizadoPersona
 * @property string|null $observacion
 * @property Carbon $fechaInventario
 * @property Carbon $fechaOperacion
 * @property Carbon $fechaCreacion
 * @property string $numero
 * @property bool $cerrado
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Moneda $moneda
 * @property Ubicacion $ubicacion
 * @property Usuario $usuario
 * @property TipoTransaccion $tipo_transaccion
 * @property Collection|Item[] $items
 *
 * @package App\Models
 */
class Inventario extends Model
{
	protected $table = 'inventario';
	protected $primaryKey = 'idInventario';
	public $timestamps = false;

	protected $casts = [
		'idUsuario' => 'int',
		'idMoneda' => 'int',
		'idTipoTransaccion' => 'int',
		'idUbicacion' => 'int',
		'idUbicacion2' => 'int',
		'documentoRelacionado' => 'float',
		'autorizadoPersona' => 'int',
		'cerrado' => 'bool',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaInventario',
		'fechaOperacion',
		'fechaCreacion'
	];

	protected $fillable = [
		'idUsuario',
		'idMoneda',
		'idTipoTransaccion',
		'idUbicacion',
		'idUbicacion2',
		'documentoRelacionado',
		'autorizadoPersona',
		'observacion',
		'fechaInventario',
		'fechaOperacion',
		'fechaCreacion',
		'numero',
		'cerrado',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function moneda()
	{
		return $this->belongsTo(Moneda::class, 'idMoneda');
	}

	public function ubicacion()
	{
		return $this->belongsTo(Ubicacion::class, 'idUbicacion');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'idUsuario');
	}

	public function tipo_transaccion()
	{
		return $this->belongsTo(TipoTransaccion::class, 'idTipoTransaccion');
	}

	public function items()
	{
		return $this->belongsToMany(Item::class, 'inventario_item', 'idInventario', 'idItem')
					->withPivot('numeroLinea', 'descripcionItem', 'cantidad', 'costo', 'precio', 'impuesto', 'descuento', 'montoTotal', 'esExento', 'fechaCreacion', 'idEmpresa', 'estado', 'activo');
	}
}
